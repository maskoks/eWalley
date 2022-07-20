//
//  LogoView.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

enum LogoViewType {
    case vertical
    case horizontal
}

final class LogoView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "main_logo")
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.attributedText = TextHelper.setupAttributes(with: Strings.Global.appTitle.string(),
                                                          textColor: Colors.Text.primary.color(),
                                                          font: Fonts.Ubuntu.medium(size: 28.0).font())
        return label
    }()

    private let type: LogoViewType

    required init(type: LogoViewType) {
        self.type = type
        super.init(frame: .zero)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func configureUI() {
        addSubview(imageView.prepareForAutoLayout())
        addSubview(label.prepareForAutoLayout())

        switch type {
        case .vertical:
            imageView.pinToSuperview([.top, .left])
            imageView.heightAnchor ~= 40.0
            imageView.widthAnchor ~= 60.0

            label.pinToSuperview([.left, .right])
            label.topAnchor ~= imageView.bottomAnchor + 18.0
        case .horizontal:
            imageView.pinEdgesToSuperviewEdges(excluding: .right)
            imageView.heightAnchor ~= 31.0
            imageView.widthAnchor ~= 47.0

            label.pinEdgesToSuperviewEdges(excluding: .left)
            label.leftAnchor ~= imageView.rightAnchor + 10.0
        }
    }
}
