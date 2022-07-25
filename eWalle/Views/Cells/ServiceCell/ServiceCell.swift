//
//  ServiceCell.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import UIKit
import RxSwift

final class ServiceCell: UICollectionViewCell {

    var viewModel: ServiceCellViewModel?
    private var disposeBag = DisposeBag()

    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Background.secondary.color()
        return view
    }()

    private let imageView = UIImageView()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func prepareForReuse() {
        disposeBag = DisposeBag()
        imageView.image = nil
    }

    public func configureUI() {
        contentView.addSubview(backView.prepareForAutoLayout())
        backView.pinEdgesToSuperviewEdges(excluding: .bottom)
        backView.heightAnchor ~= backView.widthAnchor
        backView.layer.cornerRadius = 12.0

        backView.addSubview(imageView.prepareForAutoLayout())
        imageView.pinToCenterSuperview()

        contentView.addSubview(label.prepareForAutoLayout())
        label.centerXAnchor ~= contentView.centerXAnchor
        label.pinToSuperview([.left, .right])
        label.topAnchor ~= backView.bottomAnchor + 6.0
    }

    public func bindViewModelOutputs() {
        guard let viewModel = viewModel else { return }

        viewModel
            .output
            .image
            .drive { [weak self] image in
                guard let self = self else { return }
                self.imageView.tintColor = Colors.Text.auxiliary.color()
                self.imageView.image = image
            }
            .disposed(by: disposeBag)

        viewModel
            .output
            .title
            .drive { [weak self] title in
                guard let self = self else { return }
                self.label.attributedText = TextHelper.setupAttributes(with: title,
                                                                        textColor: Colors.Text.auxiliary.color(),
                                                                        font: Fonts.AvenirNext.demibold(size: 10.0).font())
                self.label.textAlignment = .center
            }
            .disposed(by: disposeBag)
    }
}
