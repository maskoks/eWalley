//
//  MenuFlowViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 25.07.2022.
//

import UIKit

class MenuFlowViewController: UIViewController {

    var onMenuButton: (() -> Void)?

    private let menuButton = NavigationButton(type: .menu)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.addSubview(menuButton.prepareForAutoLayout())
        menuButton.pinExcludingEdgesToSuperviewEdges(top: 80.0, left: nil, bottom: nil, right: 10.0)
        menuButton.addTarget(self, action: #selector(didTapped), for: .touchUpInside)
    }

    @objc private func didTapped() {
        onMenuButton?()
    }
}
