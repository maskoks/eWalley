//
//  ProfileView.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation
import UIKit

final class ProfileView: UIView {

    private let nameLabel = UILabel()
    private let locationLabel = UILabel()

    private let backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_view_back")
        imageView.tintColor = Colors.Background.basic.color()
        return imageView
    }()

    private let profileAvatar = UIImageView()

    var user: UserModel? {
        didSet {
            setup()
        }
    }

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

        addSubview(backImage.prepareForAutoLayout())
        backImage.pinEdgesToSuperviewEdges()

        addSubview(profileAvatar.prepareForAutoLayout())
        profileAvatar.heightAnchor ~= 44.0
        profileAvatar.widthAnchor ~= 44.0
        profileAvatar.topAnchor ~= topAnchor + 32.0
        profileAvatar.leftAnchor ~= leftAnchor + 30.0

        addSubview(nameLabel.prepareForAutoLayout())
        nameLabel.leftAnchor ~= profileAvatar.rightAnchor + 10.0
        nameLabel.pinExcludingEdgesToSuperviewEdges(top: 35.0, left: nil, bottom: nil, right: 10.0)

        addSubview(locationLabel.prepareForAutoLayout())
        locationLabel.leftAnchor ~= profileAvatar.rightAnchor + 10.0
        locationLabel.pinExcludingEdgesToSuperviewEdges(top: nil, left: nil, bottom: 35.0, right: 10.0)
    }

    private func setup() {
        guard let user = user else { return }

        let fullMame = "\(user.name) \(user.surname)"
        nameLabel.attributedText = TextHelper.setupAttributes(with: fullMame,
                                                              textColor: Colors.Text.primary.color(),
                                                              font: Fonts.AvenirNext.demibold(size: 16.0).font())

        let location = "\(user.city), \(user.country)"
        locationLabel.attributedText = TextHelper.setupAttributes(with: location,
                                                              textColor: Colors.Text.secondary.color(),
                                                                  font: Fonts.AvenirNext.medium(size: 10.0).font())
        profileAvatar.layer.cornerRadius = 22.0
        profileAvatar.backgroundColor = Colors.Background.secondary.color()
        profileAvatar.image = user.avatar
    }
}
