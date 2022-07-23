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
        let time: Driver<String>
        let date: Driver<String>
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
            time: time(),
            date: date()
        )
    }


    private func time() -> Driver<String> {
        return reloadSubject
            .flatMapLatest { _ in
                return Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                    .flatMapLatest {  seconds -> Observable<String> in
                        let dateFormatter = DateFormatter()
                        dateFormatter.timeStyle = .short
                        let time = dateFormatter.string(from: Date())
                        return .just(time)
                    }
            }
            .asDriver(onErrorJustReturn: "")
    }

    private func date() -> Driver<String> {
        return reloadSubject
            .flatMapLatest { _ in
                return Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                    .flatMapLatest {  seconds -> Observable<String> in
                        let dayFormatter = DateFormatter()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MMM d, yyyy"
                        dayFormatter.dateFormat = "EEEE"
                        dayFormatter.locale = Locale(identifier: "en_US_POSIX")
                        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                        let day = dayFormatter.string(from: Date())
                        let date = dateFormatter.string(from: Date())
                        let fullDateText = "\(date) | \(day)"
                        return .just(fullDateText)
                    }
            }
            .asDriver(onErrorJustReturn: "")
    }
}
