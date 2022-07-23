//
//  SignInHeaderView.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

final class SignInHeaderView: UIView {

    private let timeLabel = UILabel()

    private let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "weather")
        return imageView
    }()

    private let temperatureLabel = UILabel()

    private let dateLabel = UILabel()

    public var time: String = "Loading..." {
        didSet {
            setupTime()
        }
    }
    public var date: String = "Please wait" {
        didSet {
            setupDate()
        }
    }
    public var temperature: Int = 34 {
        didSet {
            setupTemperature()
        }
    }

    required init() {
        super.init(frame: .zero)
        setupTime()
        setupDate()
        setupTemperature()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTemperature() {
        temperatureLabel.attributedText = TextHelper.setupAttributes(with: "\(temperature)° C",
                                                                     textColor: Colors.Text.primary.color(),
                                                                     font: Fonts.AvenirNext.demibold(size: 13.0).font())
    }

    private func setupDate() {
        dateLabel.attributedText = TextHelper.setupAttributes(with: date,
                                                              textColor: Colors.Text.secondary.color(),
                                                              font: Fonts.AvenirNext.medium(size: 13.0).font())
    }

    private func setupTime() {
        timeLabel.attributedText = TextHelper.setupAttributes(with: time,
                                                              textColor: Colors.Text.primary.color(),
                                                              font: Fonts.AvenirNext.medium(size: 24.0).font())
    }

    private func configureUI() {
        addSubview(timeLabel.prepareForAutoLayout())
        timeLabel.pinToSuperview([.top, .left])

        addSubview(weatherImage.prepareForAutoLayout())
        weatherImage.centerYAnchor ~= timeLabel.centerYAnchor
        weatherImage.leftAnchor ~= timeLabel.rightAnchor + 20.0

        addSubview(temperatureLabel.prepareForAutoLayout())
        temperatureLabel.centerYAnchor ~= weatherImage.centerYAnchor
        temperatureLabel.leftAnchor ~= weatherImage.rightAnchor + 8.0

        addSubview(dateLabel.prepareForAutoLayout())
        dateLabel.pinToSuperview([.left, .bottom])
        dateLabel.topAnchor ~= timeLabel.bottomAnchor + 7.0
    }
}
