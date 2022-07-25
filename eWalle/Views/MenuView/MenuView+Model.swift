//
//  MenuView+Model.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation

extension MenuView {
    struct Model {
        let items: [Menu]
        var selectedIndex: Int
        var callBackAction: ((MenuItemView.Model) -> Void)?
    }
}
