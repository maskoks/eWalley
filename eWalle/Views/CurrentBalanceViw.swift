//
//  CurrentBalanceViw.swift
//  eWalle
//
//  Created by Жеребцов Данил on 21.07.2022.
//

import UIKit

final class CurrentBalanceView: UIView {

    private let balanceLabel = UILabel()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.attributedText = TextHelper.setupAttributes(with: Strings.Views.currentBalance.string(),
                                                          textColor: Colors.Text.auxiliary.color(),
                                                          font: Fonts.AvenirNext.regular(size: 12.0).font())
        return label
    }()

    public let addButton = AddButton(type: .balance)

    public var balance: Int = 0 {
        didSet {
            setup()
        }
    }

    required init() {
        super.init(frame: .zero)
        setup()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        balanceLabel.attributedText = TextHelper.setupAttributes(with: String(balance),
                                                                 textColor: Colors.Text.balance.color(),
                                                                 font: Fonts.AvenirNext.demibold(size: 24.0).font())
    }

    private func configureUI() {
        layer.cornerRadius = 12.0
        backgroundColor = Colors.Background.secondary.color()

        addSubview(balanceLabel.prepareForAutoLayout())
        balanceLabel.pinExcludingEdgesToSuperviewEdges(top: 26.0, left: 25.0, bottom: nil, right: nil)
        balanceLabel.rightAnchor >= rightAnchor + 80.0

        addSubview(descriptionLabel.prepareForAutoLayout())
        descriptionLabel.leftAnchor ~= leftAnchor + 25.0
        descriptionLabel.topAnchor ~= balanceLabel.bottomAnchor + 8.0

        addSubview(addButton.prepareForAutoLayout())
        addButton.pinExcludingEdgesToSuperviewEdges(top: 34.0, left: nil, bottom: 26.0, right: 25.0)
    }
}
