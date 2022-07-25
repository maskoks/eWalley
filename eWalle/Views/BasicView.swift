//
//  BasicView.swift
//  eWalle
//
//  Created by Жеребцов Данил on 24.07.2022.
//

import UIKit

final class BasicView: UIView {
    required init() {
        super.init(frame: .zero)
        backgroundColor = Colors.Background.basic.color()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
