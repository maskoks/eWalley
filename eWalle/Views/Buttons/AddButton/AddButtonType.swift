//
//  AddButtonType.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

enum AddButtonType {
    case balance
    case sendMoney

    var size: CGFloat {
        switch self {
        case .balance:
            return 48.0
        case .sendMoney:
            return 52.0
        }
    }
}
