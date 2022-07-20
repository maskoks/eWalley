//
//  CreateAccountButton.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

final class CreateAccountButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 133.0, height: 25.0)
    }

    private func setup() {
        let title = TextHelper.setupAttributes(with: Strings.Buttons.createAccount.string(),
                                               textColor: Colors.Text.primary.color(),
                                               font: Fonts.AvenirNext.regular(size: 16.0).font())
        setAttributedTitle(title, for: .normal)
    }
}
