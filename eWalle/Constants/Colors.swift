//
//  Colors.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

struct Colors {
    enum Background {
        case basic
        case secondary

        func color() -> UIColor {
            switch self {
            case .basic:
                return UIColor(named: "Background.Basic")!
            case .secondary:
                return UIColor(named: "Gradient.Secondary")!
            }
        }
    }

    enum Text {
        case primary
        case secondary
        case auxiliary
        case dark

        func color() -> UIColor {
            switch self {
            case .primary:
                return UIColor(named: "Text.Primary")!
            case .secondary:
                return UIColor(named: "Text.Secondary")!
            case .auxiliary:
                return UIColor(named: "Text.Auxiliary")!
            case .dark:
                return UIColor(named: "Text.Dark")!
            }
        }
    }

    enum Elements {
        case orange
        case black

        func color() -> UIColor {
            switch self {
            case .orange:
                return UIColor(named: "Elements.Orange")!
            case .black:
                return UIColor(named: "Elements.Black")!
            }
        }
    }
}
