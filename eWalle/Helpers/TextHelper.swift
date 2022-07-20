//
//  TextHelper.swift
//  eWalle
//
//  Created by Жеребцов Данил on 20.07.2022.
//

import UIKit

struct TextHelper {
    static func setupAttributes(with text: String, textColor: UIColor, font: UIFont) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.12

        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraphStyle,
                                                          .foregroundColor: textColor,
                                                          .font: font]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }
}
