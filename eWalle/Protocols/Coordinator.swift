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

    func addDependency(_ coordinator: Coordinator)
    func removeDependency(_ coordinator: Coordinator?)
    func popViewController(animated: Bool)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }

    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}

