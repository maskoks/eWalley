//
//  MenuItemView+Model.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation

extension MenuItemView {
    struct Model {
        let title: Menu
        let index: Int
        var isSelected: Bool
        var callBackAction: ((Model) -> Void)?
    }
}
