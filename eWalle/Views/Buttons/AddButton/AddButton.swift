//
//  AddButton.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

final class AddButton: UIButton {

    private let type: AddButtonType

    override var intrinsicContentSize: CGSize {
        return CGSize(width: type.size, height: type.size)
    }

    required init(type: AddButtonType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.cornerRadius = type.size / 2
        backgroundColor = Colors.Elements.orange.color()
        setTitle(nil, for: .normal)
        setImage(UIImage(named: "add"), for: .normal)
    }
}
