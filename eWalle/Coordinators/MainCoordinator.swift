//
//  MainCoordinator.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import Foundation

final class MainCoordinator: BaseCoordinator {
    var finishFlow: (() -> Void)?

    override func start() {
        self.showMainPage()
    }

    private func showMainPage() {
        let viewController = MainViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }
}
