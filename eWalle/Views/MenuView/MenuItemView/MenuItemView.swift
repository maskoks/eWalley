//
//  MenuItemView.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import UIKit

class MenuItemView: UIView {

    var model: Model? {
        didSet {
            setup()
        }
    }

    private let label = UILabel()
    
    private let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Elements.orange.color()
        return view
    }()

    private let button = UIButton()

    required init() {
        super.init(frame: .zero)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        backgroundColor = .clear
        heightAnchor ~= 33.0

        addSubview(statusView.prepareForAutoLayout())
        statusView.pinEdgesToSuperviewEdges(excluding: .right)
        statusView.widthAnchor ~= 4.0

        addSubview(label.prepareForAutoLayout())
        label.leftAnchor ~= statusView.rightAnchor + 26.0
        label.centerYAnchor ~= statusView.centerYAnchor

        addSubview(button.prepareForAutoLayout())
        button.pinEdgesToSuperviewEdges()
    }

    private func setup() {
        guard let model = model else { return }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        statusView.isHidden = !model.isSelected
        if model.isSelected {
            label.attributedText = TextHelper.setupAttributes(with: model.title.rawValue,
                                                              textColor: Colors.Text.primary.color(),
                                                              font: Fonts.AvenirNext.bold(size: 16.0).font())
        } else {
            label.attributedText = TextHelper.setupAttributes(with: model.title.rawValue,
                                                              textColor: Colors.Text.primary.color(),
                                                              font: Fonts.AvenirNext.regular(size: 16.0).font())
        }
    }

    @objc private func buttonTapped() {
        guard let model = model else { return }

        model.callBackAction?(model)
    }
}
