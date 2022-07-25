//
//  FakeViewController.swift
//  eWalle
//
//  Created by Жеребцов Данил on 25.07.2022.
//

import UIKit

final class FakeViewController: MenuFlowViewController {

    private let label = UILabel()
    private let labelText: String

    required init(labelText: String) {
        self.labelText = labelText
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        super.configureUI()
        view.backgroundColor = Colors.Background.basic.color()

        view.addSubview(label.prepareForAutoLayout())
        label.pinToCenterSuperview()
        label.text = labelText
    }
}
