//
//  MenuViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit
import RxSwift

final class MenuViewController: UIViewController {
    // MARK: - Coordinate
    public var onCloseButton: (() -> Void)?
    public var itemSelected: ((MenuItemView.Model) -> Void)?
    public var onLogout: (() -> Void)?

    // MARK: - Private Properties
    private let disposeBag = DisposeBag()
    private let viewModel: MenuViewModel

    private let isSmallScreen: Bool = UIScreen.main.nativeBounds.height < 1500.0

    // MARK: - UI
    private let contentView = UIView()

    private let profileView = ProfileView()
    private let closeButton = NavigationButton(type: .close)

    private let menu = MenuView()

    private let logoutButton = LogoutButton()
    private let versionLabel: UILabel = {
        let label = UILabel()
        let version = "\(Strings.Menu.version.string()) \(AppInfo.appVersion) \(AppInfo.buildNumber)"
        label.attributedText = TextHelper.setupAttributes(with: version,
                                                          textColor: Colors.Text.auxiliary.color(),
                                                          font: Fonts.AvenirNext.medium(size: 10.0).font())
        return label
    }()

    // MARK: - Lifecycle
    required init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModelInputs()
        bindViewModelOutputs()
        viewModel.input.reload.onNext(())
    }
}

// MARK: - Rx
private extension MenuViewController {
    func bindViewModelInputs() {
        closeButton
            .rx
            .tap
            .bind { [weak self] in
                self?.onCloseButton?()
            }
            .disposed(by: disposeBag)
        logoutButton
            .rx
            .tap
            .bind { [weak self] in
                self?.onLogout?()
            }
            .disposed(by: disposeBag)
    }

    func bindViewModelOutputs() {
        viewModel
            .output
            .menuModel
            .drive { [weak self] model in
                self?.menu.model = model
            }
            .disposed(by: disposeBag)
        viewModel
            .output
            .itemSelected
            .drive { [weak self] model in
                if let model = model {
                    self?.itemSelected?(model)
                }
            }
            .disposed(by: disposeBag)
        viewModel
            .output
            .profileModel
            .drive { [weak self] user in
                if let user = user {
                    self?.profileView.user = user
                }
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - Configure
private extension MenuViewController {
    func configureUI() {
        view.backgroundColor = .clear

        configureContentView()
        configureProfileView()
        configureCloseButton()
        configureMenu()
        configureFooter()
    }

    func configureContentView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        contentView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor
    }

    func configureProfileView() {
        contentView.addSubview(profileView.prepareForAutoLayout())
        profileView.pinToSuperview([.top, .left])
    }

    func configureCloseButton() {
        contentView.addSubview(closeButton.prepareForAutoLayout())
        closeButton.pinExcludingEdgesToSuperviewEdges(top: 25.0, left: nil, bottom: nil, right: 10.0)
    }

    func configureMenu() {
        contentView.addSubview(menu.prepareForAutoLayout())
        menu.pinExcludingEdgesToSuperviewEdges(top: nil, left: 0.0, bottom: nil, right: 100.0)
        if isSmallScreen {
            menu.topAnchor ~= profileView.bottomAnchor + 10.0
        } else {
            menu.topAnchor ~= profileView.bottomAnchor + 112.0
        }
    }

    func configureFooter() {
        contentView.addSubview(versionLabel.prepareForAutoLayout())
        versionLabel.pinExcludingEdgesToSuperviewEdges(top: nil, left: 30.0, bottom: 27.0, right: nil)

        contentView.addSubview(logoutButton.prepareForAutoLayout())
        logoutButton.leftAnchor ~= contentView.leftAnchor + 30.0
        logoutButton.bottomAnchor ~= versionLabel.topAnchor - 65.0
    }
}
