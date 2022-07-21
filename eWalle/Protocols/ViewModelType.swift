//
//  ViewModelType.swift
//  eWalle
//
//  Created by Жеребцов Данил on 21.07.2022.
//

import Foundation

protocol ViewModelType: AnyObject {
    associatedtype Input
    associatedtype Output

    var input: Input! { get }
    var output: Output! { get }
}
