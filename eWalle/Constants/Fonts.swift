//
//  Fonts.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

struct Fonts {
    enum AvenirNext {
        case regular(size: CGFloat)
        case medium(size: CGFloat)
        case demibold(size: CGFloat)
        case bold(size: CGFloat)

        func font() -> UIFont {
            switch self {
            case .regular(let size):
                return UIFont(name: "AvenirNextCyr-Regular", size: size)!
            case .medium(let size):
                return UIFont(name: "AvenirNextCyr-Medium", size: size)!
            case .demibold(let size):
                return UIFont(name: "AvenirNextCyr-Demi", size: size)!
            case .bold(let size):
                return UIFont(name: "AvenirNextCyr-Bold", size: size)!
            }
        }
    }
}
