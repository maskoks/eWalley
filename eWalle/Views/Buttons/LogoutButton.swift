//
//  LogoutButton.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import UIKit

final class LogoutButton: UIButton {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 79, height: 25.0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -8.0, bottom: 0.0, right: 0.0)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let title = TextHelper.setupAttributes(with: Strings.Buttons.logout.string(),
                                               textColor: Colors.Text.primary.color(),
                                               font: Fonts.AvenirNext.bold(size: 16.0).font())
        setAttributedTitle(title, for: .normal)
        setImage(UIImage(named: "logout"), for: .normal)
        tintColor = Colors.Text.primary.color()
    }
}
