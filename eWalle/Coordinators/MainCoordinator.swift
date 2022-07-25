//
//  MainCoordinator.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import Foundation
import UIKit

final class MainCoordinator: BaseCoordinator {

    var finishFlow: (() -> Void)?
    var selectedIndex = 0

    override func start() {
        self.showMainPage()
    }

    private func showMainPage() {
        let rootViewController = HomeViewController(viewModel: HomeViewModel())
        let viewController = mainViewController(rootViewController: rootViewController, selectedIndex: selectedIndex)
        navigationController.setViewControllers([viewController], animated: true)
    }

    private func goToPage(with model: MenuItemView.Model) {
        selectedIndex = model.index
        var rootViewController: MenuFlowViewController {
            switch model.title {
            case .home:
                return HomeViewController(viewModel: HomeViewModel())
            default:
                return FakeViewController(labelText: model.title.rawValue)
            }
        }
        let viewController = mainViewController(rootViewController: rootViewController, selectedIndex: selectedIndex)
        navigationController.setViewControllers([viewController], animated: true)
    }

    private func mainViewController(rootViewController: MenuFlowViewController, selectedIndex: Int) -> MainViewController {
        let mainViewController = MainViewController(rootViewController: rootViewController, selectedIndex: selectedIndex)
        mainViewController.navigateTo = { [weak self] model in
            self?.goToPage(with: model)
        }
        mainViewController.finishFlow = { [weak self] in
            self?.finishFlow?()
        }
        return mainViewController
    }
}
