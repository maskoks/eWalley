//
//  SignInButton.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

final class SignInButton: UIButton {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 190.0, height: 50.0)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -8.0)
    }

    private func setup() {
        backgroundColor = Colors.Elements.orange.color()

        setImage(UIImage(named: "arrow"), for: .normal)
        tintColor = Colors.Text.signIn.color()
        semanticContentAttribute = .forceRightToLeft

        let title = TextHelper.setupAttributes(with: Strings.Buttons.signIn.string(),
                                               textColor: Colors.Text.signIn.color(),
                                               font: Fonts.AvenirNext.demibold(size: 16.0).font())
        setAttributedTitle(title, for: .normal)
    }
}
