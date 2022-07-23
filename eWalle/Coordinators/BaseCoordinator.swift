//
//  BaseCoordinator.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit

class BaseCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController

    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true

        super.init()
    }

    func start() {
        fatalError("Coordinator must override start function")
    }

    func addDependency(_ coordinator: Coordinator) {
        guard !self.childCoordinators.contains(where: { $0 === coordinator }) else { return }
        self.childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard self.childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators.filter({ $0 !== coordinator }).forEach({ coordinator.removeDependency($0) })
        }
        for (index, element) in self.childCoordinators.enumerated() where element === coordinator {
            self.childCoordinators.remove(at: index)
            break
        }
    }
}
