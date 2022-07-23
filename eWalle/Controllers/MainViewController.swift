//
//  MainViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit
import LGSideMenuController

class MainViewController: LGSideMenuController {

    let root = HomeViewController()
    let left = MenuViewController()

    var onDidLoad: (()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onDidLoad?()

        view.backgroundColor = .red
        self.leftViewPresentationStyle = .slideAbove
        root.onButton = {
            self.showLeftView()
            let view = self.rootViewController!.view!
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                view.frame.origin.x += 168
                view.frame.origin.y += 108
                view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 6)

            }
        }
        self.rootViewController = root
        self.leftViewController = left


    }
}
