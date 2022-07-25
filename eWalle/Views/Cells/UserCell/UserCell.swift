//
//  UserCell.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import UIKit
import RxSwift

final class UserCell: UICollectionViewCell {

    var viewModel: UserCellViewModel?
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
        backView.pinEdgesToSuperviewEdges()
        backView.layer.cornerRadius = 12.0

        backView.addSubview(imageView.prepareForAutoLayout())
        imageView.topAnchor ~= backView.topAnchor + 20.0
        imageView.centerXAnchor ~= backView.centerXAnchor
        imageView.heightAnchor ~= 46.0
        imageView.widthAnchor ~= 46.0
        imageView.layer.cornerRadius = 23.0

        backView.addSubview(label.prepareForAutoLayout())
        label.pinExcludingEdgesToSuperviewEdges(top: nil, left: 5.0, bottom: nil, right: 5.0)
        label.topAnchor ~= imageView.bottomAnchor + 14.0
    }

    public func bindViewModelOutputs() {
        guard let viewModel = viewModel else { return }

        viewModel
            .output
            .image
            .drive { [weak self] image in
                self?.imageView.image = image
            }
            .disposed(by: disposeBag)

        viewModel
            .output
            .name
            .drive { [weak self] name in
                guard let self = self else { return }
                self.label.attributedText = TextHelper.setupAttributes(with: name,
                                                                        textColor: Colors.Text.auxiliary.color(),
                                                                        font: Fonts.AvenirNext.regular(size: 12.0).font())
                self.label.textAlignment = .center
            }
            .disposed(by: disposeBag)
    }
}
