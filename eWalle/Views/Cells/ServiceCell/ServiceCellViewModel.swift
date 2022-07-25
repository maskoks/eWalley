//
//  ServiceCellViewModel.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class ServiceCellViewModel: NSObject, ViewModelType {
    struct Input {
        let reload: AnyObserver<Void>
    }

    struct Output {
        let image: Driver<UIImage>
        let title: Driver<String>
    }

    private let service: Service

    private(set) var input: Input!
    private(set) var output: Output!

    private let reloadSubject = PublishSubject<Void>()

    init(service: Service) {
        self.service = service
        super.init()
        self.input = Input(
            reload: reloadSubject.asObserver()
        )
        self.output = Output(
            image: image(image: service.image),
            title: title(title: service.title)
        )
    }

    private func image(image: UIImage) -> Driver<UIImage> {
        reloadSubject
            .flatMapLatest { _ -> Observable<UIImage> in
                return .just(image)
            }
            .asDriver(onErrorJustReturn: UIImage())
    }

    private func title(title: String) -> Driver<String> {
        reloadSubject
            .flatMapLatest { _ -> Observable<String> in
                return .just(title)
            }
            .asDriver(onErrorJustReturn: "")
    }
}
