//
//  HomeViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 22.07.2022.
//

import UIKit
import RxSwift
import LGSideMenuController

class HomeViewController: UIViewController {

    var onButton: (() -> Void)?

    let button = SignInButton()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        view.addSubview(button.prepareForAutoLayout())
        button.pinToCenterSuperview()

        button
            .rx
            .tap
            .bind { [weak self] in
                self?.showMenu()
            }
            .disposed(by: disposeBag)
    }

    private func showMenu() {
        onButton?()
    }

}
