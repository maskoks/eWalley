//
//  NavigationButtonType.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

enum NavigationButtonType {
    case close
    case qrcode
    case menu
    case filter

    var image: UIImage {
        switch self {
        case .close:
            return UIImage(named: "close")!
        case .qrcode:
            return UIImage(named: "qr_code")!
        case .menu:
            return UIImage(named: "menu")!
        case .filter:
            return UIImage(named: "filter")!
        }
    }

    var tintColor: UIColor {
        switch self {
        case .menu:
            return Colors.Elements.black.color()
        default:
            return Colors.Text.auxiliary.color()
        }
    }
}
