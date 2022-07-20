//
//  Strings.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import Foundation

struct Strings {
    enum Buttons {
        case signIn
        case createAccount

        func string() -> String {
            switch self {
            case .signIn:
                return NSLocalizedString("Views.Button.Title.SignIn", comment: "")
            case .createAccount:
                return NSLocalizedString("Views.Button.Title.CreateAccount", comment: "")
            }
        }
    }
}
