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
        case logout

        func string() -> String {
            switch self {
            case .signIn:
                return NSLocalizedString("Button.Title.SignIn", comment: "")
            case .createAccount:
                return NSLocalizedString("Button.Title.CreateAccount", comment: "")
            case .logout:
                return NSLocalizedString("Button.Title.Logout", comment: "")
            }
        }
    }

    enum Views {
        case currentBalance

        func string() -> String {
            switch self {
            case .currentBalance:
                return NSLocalizedString("Views.CurrentBalance.DescriptionLabel.Text", comment: "")
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
    
    enum HomeVC {
        case accountOverview
        case sendMoney
        case services

        func string() -> String {
            switch self {
            case .accountOverview:
                return NSLocalizedString("HomeVC.AccountOverview.Text", comment: "")
            case .sendMoney:
                return NSLocalizedString("HomeVC.SendMoney.Text", comment: "")
            case .services:
                return NSLocalizedString("HomeVC.Services.Text", comment: "")
            }
        }
    }

    // MARK: - MenuVC
    enum Menu {
        case home
        case profile
        case accounts
        case transactions
        case stats
        case settings
        case help
        case version

        func string() -> String {
            switch self {
            case .home:
                return NSLocalizedString("MenuVC.MenuView.Item.Home", comment: "")
            case .profile:
                return NSLocalizedString("MenuVC.MenuView.Item.Profile", comment: "")
            case .accounts:
                return NSLocalizedString("MenuVC.MenuView.Item.Accounts", comment: "")
            case .transactions:
                return NSLocalizedString("MenuVC.MenuView.Item.Transactions", comment: "")
            case .stats:
                return NSLocalizedString("MenuVC.MenuView.Item.Stats", comment: "")
            case .settings:
                return NSLocalizedString("MenuVC.MenuView.Item.Settings", comment: "")
            case .help:
                return NSLocalizedString("MenuVC.MenuView.Item.Help", comment: "")
            case .version:
                return NSLocalizedString("MenuVC.VersionLabel.Title", comment: "")
            }
        }
    }

    enum ServicesTitle {
        case sendMoney
        case reciveMoney
        case mobilePrepaid
        case electricityBill
        case cashbackOfer
        case movieTickets
        case flightTickets
        case moreOptions

        func string() -> String {
            switch self {
            case .sendMoney:
                return NSLocalizedString("Global.Services.SendMoney", comment: "")
            case .reciveMoney:
                return NSLocalizedString("Global.Services.ReceiveMoney", comment: "")
            case .mobilePrepaid:
                return NSLocalizedString("Global.Services.MobilePrepaid", comment: "")
            case .electricityBill:
                return NSLocalizedString("Global.Services.ElectricityBill", comment: "")
            case .cashbackOfer:
                return NSLocalizedString("Global.Services.CashbackOffer", comment: "")
            case .movieTickets:
                return NSLocalizedString("Global.Services.MovieTickets", comment: "")
            case .flightTickets:
                return NSLocalizedString("Global.Services.FlightTickets", comment: "")
            case .moreOptions:
                return NSLocalizedString("Global.Services.MoreOptions", comment: "")
            }
        }
    }
}
