//
//  SendMoneyReusableHeader.swift
//  eWalle
//
//  Created by Жеребцов Данил on 24.07.2022.
//

import UIKit

final class SendMoneyReusableHeader: UICollectionReusableView {

    public let button = AddButton(type: .sendMoney)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.Background.basic.color()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        heightAnchor ~= 120.0
        widthAnchor ~= 80.0
        backgroundColor = Colors.Background.basic.color()
        addSubview(button.prepareForAutoLayout())
        button.pinToCenterSuperview()
    }
}
