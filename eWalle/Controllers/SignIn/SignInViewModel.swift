//
//  SignInViewModel.swift
//  eWalle
//
//  Created by Жеребцов Данил on 21.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class SignInViewModel: NSObject, ViewModelType {
    
    struct Input {
        let reload: AnyObserver<Void>
        let signInTapped: AnyObserver<Void>
        let createAccountTapped: AnyObserver<Void>
    }

    struct Output {

    }

    private(set) var input: Input!
    private(set) var output: Output!

    private let reloadSubject = PublishSubject<Void>()
    private let signInTappedSubject = PublishSubject<Void>()
    private let createAccountTappedSubject = PublishSubject<Void>()

    override init() {
        super.init()
        self.input = Input(
            reload: reloadSubject.asObserver(),
            signInTapped: signInTappedSubject.asObserver(),
            createAccountTapped: createAccountTappedSubject.asObserver()
        )
        self.output = Output(

        )
    }
}
