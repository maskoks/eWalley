//
//  NavigationButton.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

class NavigationButton: UIButton {

    let type: NavigationButtonType

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 44.0, height: 44.0)
    }

    required init(type: NavigationButtonType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        tintColor = type.tintColor
        setTitle(nil, for: .normal)
        setImage(type.image, for: .normal)
    }
}
