//
//  Coordinator.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }

    func start()

    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
    func popViewController(animated: Bool)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }

        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }

    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}

