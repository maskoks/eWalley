//
//  MenuView.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import UIKit

final class MenuView: UIView {

    public var model: Model? {
        didSet {
            setup()
        }
    }

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 15.0
        return stack
    }()

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

        addSubview(stackView.prepareForAutoLayout())
        stackView.pinEdgesToSuperviewEdges()
    }

    private func setup() {
        clearStack()
        guard let model = model else { return }
        for (index, item) in model.items.enumerated() {
            let model = MenuItemView.Model(title: item, index: index, isSelected: model.selectedIndex == index) { [weak self] model in
                self?.model?.callBackAction?(model)
            }
            let view = MenuItemView()
            view.model = model
            stackView.addArrangedSubview(view)
        }
    }

    private func clearStack() {
        stackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
    }
}
