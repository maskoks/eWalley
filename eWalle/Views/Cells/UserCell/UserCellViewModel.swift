//
//  UserCellViewModel.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class UserCellViewModel: NSObject, ViewModelType {
    struct Input {
        let reload: AnyObserver<Void>
    }

    struct Output {
        let image: Driver<UIImage>
        let name: Driver<String>
    }

    private let user: UserModel

    private(set) var input: Input!
    private(set) var output: Output!

    private let reloadSubject = PublishSubject<Void>()

    init(user: UserModel) {
        self.user = user
        super.init()
        self.input = Input(
            reload: reloadSubject.asObserver()
        )
        self.output = Output(
            image: image(image: user.avatar),
            name: name(name: user.name)
        )
    }

    private func image(image: UIImage) -> Driver<UIImage> {
        reloadSubject
            .flatMapLatest { _ -> Observable<UIImage> in
                return .just(image)
            }
            .asDriver(onErrorJustReturn: UIImage())
    }

    private func name(name: String) -> Driver<String> {
        reloadSubject
            .flatMapLatest { _ -> Observable<String> in
                return .just(name)
            }
            .asDriver(onErrorJustReturn: "")
    }
}
