//
//  HomeViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit
import RxSwift
import RxDataSources
import LGSideMenuController

final class HomeViewController: MenuFlowViewController {

    // MARK: - UI
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let contentView = BasicView()
    private let servicesCellWidth = UIScreen.main.bounds.width/4-28.0

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()

    // MARK:  Header
    private let headerSectionView = BasicView()

    private let logoView = LogoView(type: .horizontal)
    private let menuButton = NavigationButton(type: .menu)

    // MARK:  Account Overview
    private let accountOverviewSectionView = BasicView()

    private let accountOverviewLabel: UILabel = {
        let label = UILabel()
        label.attributedText = TextHelper.setupAttributes(with: Strings.HomeVC.accountOverview.string(),
                                                          textColor: Colors.Text.auxiliary.color(),
                                                          font: Fonts.AvenirNext.demibold(size: 16.0).font())
        return label
    }()

    private let currentBalanceView = CurrentBalanceView()

    // MARK:  Send Money
    private let sendMoneySectionView = BasicView()
    
    private let sendMoneyLabel: UILabel = {
        let label = UILabel()
        label.attributedText = TextHelper.setupAttributes(with: Strings.HomeVC.sendMoney.string(),
                                                          textColor: Colors.Text.auxiliary.color(),
                                                          font: Fonts.AvenirNext.demibold(size: 16.0).font())
        return label
    }()
    private let qrcodeButton = NavigationButton(type: .qrcode)

    private var usersCollectionView: UICollectionView!

    // MARK:  Services
    private let servicesSectionView = BasicView()

    private let servicesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = TextHelper.setupAttributes(with: Strings.HomeVC.services.string(),
                                                          textColor: Colors.Text.auxiliary.color(),
                                                          font: Fonts.AvenirNext.demibold(size: 16.0).font())
        return label
    }()

    private let filterButton = NavigationButton(type: .filter)

    private var servicesCollectionView: UICollectionView!

    // MARK: - Private Properties
    private let disposeBag = DisposeBag()
    private let viewModel: HomeViewModel

    // MARK: - DataSources
    private lazy var userDataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, UserCellViewModel>>(
        configureCell: { (_, collectionView, indexPath, element) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
            cell.viewModel = element
            cell.configureUI()
            cell.bindViewModelOutputs()
            cell.viewModel?.input.reload.onNext(())
            return cell
        }, configureSupplementaryView: {[weak self] (ds,cv,kind,index) -> UICollectionReusableView in
            guard let self = self else { return UICollectionReusableView() }
            if kind == UICollectionView.elementKindSectionHeader {
                let header = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: index) as! SendMoneyReusableHeader
                header.button
                    .rx
                    .tap
                    .bind {
                        print("add")
                    }
                    .disposed(by: self.disposeBag)
                return header
            } else {
                return UICollectionReusableView()
            }
        }
    )

    private let servicesDataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, ServiceCellViewModel>>(
        configureCell: { (_, collectionView, indexPath, element) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ServiceCell
            cell.viewModel = element
            cell.configureUI()
            cell.bindViewModelOutputs()
            cell.viewModel?.input.reload.onNext(())
            return cell
        })

    // MARK: - Layout
    private lazy var serviceLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: servicesCellWidth, height: servicesCellWidth*1.5)
        layout.minimumLineSpacing = 28.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
        return layout
    }()

    private let usersLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100.0, height: 120.0)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.headerReferenceSize = CGSize(width: 80.0, height: 120.0)
        return layout
    }()

    // MARK: - Lifecycle
    required init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setUpCollections()
        super.viewDidLoad()
        bindViewModelInputs()
        bindViewModelOutputs()
        viewModel.input.reload.onNext(())
    }

    private func setUpCollections() {
        usersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: usersLayout)
        usersCollectionView.register(UserCell.self, forCellWithReuseIdentifier: "cell")
        usersCollectionView.register(SendMoneyReusableHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        usersCollectionView.isScrollEnabled = true
        usersCollectionView.showsHorizontalScrollIndicator = false

        servicesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: serviceLayout)
        servicesCollectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "cell")
        usersCollectionView.isScrollEnabled = true
        usersCollectionView.showsHorizontalScrollIndicator = false
    }


    override func configureUI() {
        view.backgroundColor = Colors.Background.basic.color()
        configureScrollView()
        configureContentView()
        configureHeader()
        configureAccountOverviewSection()
        configureSendMoneySection()
        configureServicesSection()

        configureStackView()
    }
}

// MARK: - Rx
private extension HomeViewController {
    func bindViewModelInputs() {
        menuButton
            .rx
            .tap
            .bind { [weak self] in
                self?.onMenuButton?()
            }
            .disposed(by: disposeBag)
    }

    func bindViewModelOutputs() {
        self.viewModel
            .output
            .usersDataSource
            .drive(usersCollectionView.rx.items(dataSource: userDataSource))
            .disposed(by: self.disposeBag)
        self.viewModel
            .output
            .servicesDataSource
            .drive(servicesCollectionView.rx.items(dataSource: servicesDataSource))
            .disposed(by: self.disposeBag)
    }
}

// MARK: - Configure
extension HomeViewController {
    func configureScrollView() {
        view.addSubview(scrollView.prepareForAutoLayout())
        scrollView.pinEdgesToSuperviewEdges(excluding: .top)
        scrollView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor
    }

    func configureContentView() {
        scrollView.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        contentView.widthAnchor ~= scrollView.widthAnchor
    }

    func configureHeader() {
        headerSectionView.addSubview(logoView.prepareForAutoLayout())
        logoView.pinExcludingEdgesToSuperviewEdges(top: 31.0, left: 25.0, bottom: nil, right: nil)

        headerSectionView.addSubview(menuButton.prepareForAutoLayout())
        menuButton.pinToSuperview([.right, .bottom])
        menuButton.centerYAnchor ~= logoView.centerYAnchor
    }

    func configureAccountOverviewSection() {
        accountOverviewSectionView.addSubview(accountOverviewLabel.prepareForAutoLayout())
        accountOverviewLabel.pinExcludingEdgesToSuperviewEdges(top: 50.0, left: 25.0, bottom: nil, right: nil)

        accountOverviewSectionView.addSubview(currentBalanceView.prepareForAutoLayout())
        currentBalanceView.pinExcludingEdgesToSuperviewEdges(top: nil, left: 25.0, bottom: 0.0, right: 25.0)
        currentBalanceView.topAnchor ~= accountOverviewLabel.bottomAnchor + 20.0
    }

    func configureSendMoneySection() {
        sendMoneySectionView.addSubview(sendMoneyLabel.prepareForAutoLayout())
        sendMoneyLabel.pinExcludingEdgesToSuperviewEdges(top: 40.0, left: 25.0, bottom: nil, right: nil)

        sendMoneySectionView.addSubview(qrcodeButton.prepareForAutoLayout())
        qrcodeButton.centerYAnchor ~= sendMoneyLabel.centerYAnchor
        qrcodeButton.rightAnchor ~= sendMoneySectionView.rightAnchor

        sendMoneySectionView.addSubview(usersCollectionView.prepareForAutoLayout())
        usersCollectionView.pinExcludingEdgesToSuperviewEdges(top: nil, left: 10.0, bottom: 0.0, right: 0.0)
        usersCollectionView.topAnchor ~= qrcodeButton.bottomAnchor + 10.0
        usersCollectionView.heightAnchor ~= 120.0
    }

    func configureServicesSection() {
        servicesSectionView.addSubview(servicesLabel.prepareForAutoLayout())
        servicesLabel.pinExcludingEdgesToSuperviewEdges(top: 40.0, left: 25.0, bottom: nil, right: nil)

        servicesSectionView.addSubview(filterButton.prepareForAutoLayout())
        filterButton.centerYAnchor ~= servicesLabel.centerYAnchor
        filterButton.rightAnchor ~= servicesSectionView.rightAnchor

        servicesSectionView.addSubview(servicesCollectionView.prepareForAutoLayout())
        servicesCollectionView.pinExcludingEdgesToSuperviewEdges(top: nil, left: 0.0, bottom: 0.0, right: 0.0)
        servicesCollectionView.topAnchor ~= filterButton.bottomAnchor + 24.0
        servicesCollectionView.heightAnchor ~= servicesCellWidth*1.5*2+28.0
    }

    func configureStackView() {
        contentView.addSubview(stackView.prepareForAutoLayout())
        stackView.pinEdgesToSuperviewEdges()
        stackView.widthAnchor ~= scrollView.widthAnchor

        stackView.addArrangedSubview(headerSectionView.prepareForAutoLayout())
        headerSectionView.widthAnchor ~= stackView.widthAnchor

        stackView.addArrangedSubview(accountOverviewSectionView.prepareForAutoLayout())
        accountOverviewSectionView.widthAnchor ~= stackView.widthAnchor

        stackView.addArrangedSubview(sendMoneySectionView.prepareForAutoLayout())
        sendMoneySectionView.widthAnchor ~= stackView.widthAnchor

        stackView.addArrangedSubview(servicesSectionView.prepareForAutoLayout())
        servicesSectionView.widthAnchor ~= stackView.widthAnchor
    }
}
