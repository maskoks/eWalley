//
//  AppCoordinator.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {

    var isAutorized = false // fake authorisation logic

    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }

    override func start() {
        self.runFlow(isAuthorised: isAutorized)
    }

    private func runFlow(isAuthorised: Bool) {
        if isAuthorised {
            runMainFlow()
        } else {
            runSignInFlow()
        }
    }

    private func runSignInFlow() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        signInCoordinator.finishFlow = { [weak self] in
            guard let self = self else { return }
            self.removeDependency(signInCoordinator)
            self.isAutorized = true
            self.runFlow(isAuthorised: self.isAutorized)
        }
        self.addDependency(signInCoordinator)
        signInCoordinator.start()
    }

    private func runMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.finishFlow = { [weak self] in
            guard let self = self else { return }
            self.removeDependency(mainCoordinator)
            self.isAutorized = false
            self.runFlow(isAuthorised: self.isAutorized)
        }
        self.addDependency(mainCoordinator)
        mainCoordinator.start()
    }
}

