//
//  HomeViewModel.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel: NSObject, ViewModelType {
    struct Input {
        let reload: AnyObserver<Void>
    }

    struct Output {
        let usersDataSource: Driver<[SectionModel<String, UserCellViewModel>]>
        let servicesDataSource: Driver<[SectionModel<String, ServiceCellViewModel>]>
    }

    private(set) var input: Input!
    private(set) var output: Output!

    private let reloadSubject = PublishSubject<Void>()

    override init() {
        super.init()
        self.input = Input(
            reload: reloadSubject.asObserver()
        )
        self.output = Output(
            usersDataSource: fetchUsersDataSource(),
            servicesDataSource: fetchServiceDataSource()
        )
    }

    private func fetchUsersDataSource() -> Driver<[SectionModel<String, UserCellViewModel>]> {
        reloadSubject
            .flatMapLatest { [weak self] _ -> Observable<[UserModel]> in
                guard let `self` = self else { return .empty() }
                return self.fakeUserRequest()
            }
            .flatMapLatest { users -> Observable<[SectionModel<String, UserCellViewModel>]> in
                let viewModels = users.map({UserCellViewModel(user: $0)})
                return .just([SectionModel(model: "", items: viewModels)])
            }
            .asDriver(onErrorJustReturn: [])
    }

    private func fetchServiceDataSource() -> Driver<[SectionModel<String, ServiceCellViewModel>]> {
        reloadSubject
            .flatMapLatest { [weak self] _ -> Observable<[Service]> in
                guard let `self` = self else { return .empty() }
                return self.fakeServeciesRequest()
            }
            .flatMapLatest { services -> Observable<[SectionModel<String, ServiceCellViewModel>]> in
                let viewModels = services.map({ServiceCellViewModel(service: $0)})
                return .just([SectionModel(model: "", items: viewModels)])
            }
            .asDriver(onErrorJustReturn: [])
    }

    private func fakeUserRequest() -> Observable<[UserModel]> {
        return Observable.create { observer in
            // fake services request and get services in response
            let response: [UserModel] = [
                UserModel(name: "Mike", surname: "Doe", avatar: UIImage(named: "user2")!, city: "Moscow", country: "Russia"),
                UserModel(name: "Joshpeh", surname: "Smith", avatar: UIImage(named: "user3")!, city: "New-York", country: "USA"),
                UserModel(name: "Mike", surname: "Doe", avatar: UIImage(named: "user2")!, city: "Moscow", country: "Russia"),
                UserModel(name: "Joshpeh", surname: "Smith", avatar: UIImage(named: "user3")!, city: "New-York", country: "USA"),
                UserModel(name: "Mike", surname: "Doe", avatar: UIImage(named: "user2")!, city: "Moscow", country: "Russia"),
                UserModel(name: "Joshpeh", surname: "Smith", avatar: UIImage(named: "user3")!, city: "New-York", country: "USA")
            ]
            observer.onNext(response)
            return Disposables.create()
        }
    }

    private func fakeServeciesRequest() -> Observable<[Service]> {
        return Observable.create { observer in
            // fake services request and get services in response
            let response = Service.allCases
            observer.onNext(response)
            return Disposables.create()
        }
    }
}
