//
//  SignInCoordinator.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit

final class SignInCoordinator: BaseCoordinator {
    var finishFlow: (() -> Void)?

    override func start() {
        self.showAuthPage()
    }

    private func showAuthPage() {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController(viewModel: viewModel)
        viewController.onCompleteSignIn = { [weak self] in
            guard let self = self else { return }
            self.finishFlow?()
        }
        navigationController.setViewControllers([viewController], animated: true)
    }
}
