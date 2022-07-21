//
//  SignInViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 21.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class SignInViewController: UIViewController {

    // MARK: - UI
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Background.basic.color()
        return view
    }()

    private let backLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        return imageView
    }()

    private let headerView = SignInHeaderView()

    private let logoView = LogoView(type: .vertical)

    private let labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 30.0
        return stack
    }()

    private let mainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let signInButton = SignInButton()
    private let createAccountButton = CreateAccountButton()

    // MARK: - Private Properties
    private let viewModel: SignInViewModel
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle
    init(viewModel: SignInViewModel) {
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
    }
}

// MARK: - Configure
private extension SignInViewController {
    func configureUI() {
        configureContentView()
        configureImageView()
        configureHeaderView()
        configureLogoView()
        configureLabelsStackView()
        configureButtons()
    }

    func configureContentView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        contentView.topAnchor ~= view.safeAreaLayoutGuide.topAnchor
    }

    func configureImageView() {
        contentView.addSubview(backLogoImageView.prepareForAutoLayout())
        backLogoImageView.pinEdgesToSuperviewEdges(excluding: .right)
    }

    func configureHeaderView() {
        contentView.addSubview(headerView.prepareForAutoLayout())
        headerView.pinExcludingEdgesToSuperviewEdges(top: 35.0, left: nil, bottom: nil, right: 29.0)
        headerView.leftAnchor ~= backLogoImageView.rightAnchor + 26.0
    }

    func configureLogoView() {
        contentView.addSubview(logoView.prepareForAutoLayout())
        logoView.centerYAnchor ~= contentView.centerYAnchor - 30.0
        logoView.leftAnchor ~= backLogoImageView.rightAnchor + 26.0
    }

    func configureLabelsStackView() {
        contentView.addSubview(labelStackView.prepareForAutoLayout())
        labelStackView.leftAnchor ~= backLogoImageView.rightAnchor + 26.0
        labelStackView.rightAnchor ~= contentView.rightAnchor - 27.0
        labelStackView.topAnchor ~= logoView.bottomAnchor + 16.0
    }

    func configureButtons() {
        contentView.addSubview(createAccountButton.prepareForAutoLayout())
        createAccountButton.leftAnchor ~= backLogoImageView.leftAnchor + 55.0
        createAccountButton.bottomAnchor ~= contentView.bottomAnchor - 53.0

        contentView.addSubview(signInButton.prepareForAutoLayout())
        signInButton.leftAnchor ~= backLogoImageView.rightAnchor + 26.0
        signInButton.bottomAnchor ~= createAccountButton.topAnchor - 29.0
    }
}

// MARK: - Rx
private extension SignInViewController {
    func bindViewModelInputs() {
        
    }

    func bindViewModelOutputs() {

    }
}
