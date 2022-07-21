//
//  Strings.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import Foundation

struct Strings {
    enum Global {
        case appTitle

        func string() -> String {
            switch self {
            case .appTitle:
                return NSLocalizedString("Global.App.Title", comment: "")
            }
        }
    }

    enum Buttons {
        case signIn
        case createAccount

        func string() -> String {
            switch self {
            case .signIn:
                return NSLocalizedString("Button.Title.SignIn", comment: "")
            case .createAccount:
                return NSLocalizedString("Button.Title.CreateAccount", comment: "")
            }
        }
    }

    enum Views {
        case currentBalance

        func string() -> String {
            switch self {
            case .currentBalance:
                return NSLocalizedString("Views.CurrentBalance..DescriptionLabel.Text", comment: "")
            }
        }
    }

    enum SignInVC {
        case mainLabel
        case secondaryLabel

        func string() -> String {
            switch self {
            case .mainLabel:
                return NSLocalizedString("SignInVC.MainLabel.Text", comment: "")
            case .secondaryLabel:
                return NSLocalizedString("SignInVC.SecondaryLabel.Text", comment: "")
            }
        }
    }
}
