//
//  MainViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit
import LGSideMenuController

final class MainViewController: LGSideMenuController {

    var navigateTo: ((MenuItemView.Model) -> Void)?
    var finishFlow: (() -> Void)?

    // MARK: - Lifecycle
    required init(rootViewController: MenuFlowViewController, selectedIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.rootViewController = rootViewController
        self.leftViewController = MenuViewController(viewModel: MenuViewModel(selectedIndex: selectedIndex))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.Background.secondary.color()
        isLeftViewSwipeGestureEnabled = false
        configureRootViewController()
        configureLeftViewController()
    }

    private func configureRootViewController() {
        guard let root = rootViewController as? MenuFlowViewController else { return }
        root.onMenuButton = { [weak self] in
            guard let self = self else { return }
            self.showLeftView(animated: false)
            self.openMenuAnimation()
        }
    }

    private func configureLeftViewController() {
        guard let left = leftViewController as? MenuViewController else { return }
        self.leftViewPresentationStyle = .slideAbove

        left.onCloseButton = { [weak self] in
            guard let self = self else { return }
            self.hideLeftView(animated: false)
            self.closeMenuAnimation()
        }
        left.itemSelected = { [weak self] model in
            self?.navigateTo?(model)
        }
        left.onLogout = { [weak self] in
            self?.finishFlow?()
        }

        leftViewWidth = view.bounds.width
    }

    private func openMenuAnimation() {
        let view = self.rootViewController!.view!
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            view.frame = CGRect(x: view.frame.origin.x+200, y: view.frame.origin.y+50, width: view.frame.width, height: view.frame.height)
            let rotate = CGAffineTransform(rotationAngle: -CGFloat.pi / 10)
            let scale = CGAffineTransform(scaleX: 0.6, y: 0.6)
            let concat = rotate.concatenating(scale)
            view.transform = concat
        }
    }

    private func closeMenuAnimation() {
        let view = self.rootViewController!.view!
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            view.transform = .identity
            self.rootViewController = self.rootViewController
        }
    }
}
