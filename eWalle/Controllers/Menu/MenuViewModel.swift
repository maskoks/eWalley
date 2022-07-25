//
//  MenuViewModel.swift
//  eWalle
//
//  Created by Жеребцов Данил on 25.07.2022.
//

import Foundation
import RxCocoa
import RxSwift

final class MenuViewModel: NSObject, ViewModelType {
    struct Input {
        let reload: AnyObserver<Void>
    }

    struct Output {
        let menuModel: Driver<MenuView.Model>
        let itemSelected: Driver<MenuItemView.Model?>
        let profileModel: Driver<UserModel?>
    }

    let selectedIndex: Int
    let menuItems: [Menu] = Menu.allCases

    private(set) var input: Input!
    private(set) var output: Output!

    private let reloadSubject = PublishSubject<Void>()
    private let menuItemSelectedSubject = PublishSubject<MenuItemView.Model?>()

    init(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        super.init()
        self.input = Input(
            reload: reloadSubject.asObserver()
        )
        self.output = Output(
            menuModel: menuViewConfigure(selectedIndex: selectedIndex, items: menuItems),
            itemSelected: menuItemSelectedSubject.asDriver(onErrorJustReturn: nil),
            profileModel: fakeUserRequest()
        )
    }

    private func menuViewConfigure(selectedIndex: Int, items: [Menu]) -> Driver<MenuView.Model> {
        reloadSubject
            .flatMapLatest { _ -> Observable<MenuView.Model> in
                let model = MenuView.Model(items: items, selectedIndex: selectedIndex) { [weak self] model in
                    self?.menuItemSelectedSubject.onNext(model)
                }
                return .just(model)
            }
            .asDriver(onErrorJustReturn: MenuView.Model(items: [], selectedIndex: 0))
    }

    private func fakeUserRequest() -> Driver<UserModel?> {
        reloadSubject
            .flatMapLatest { _ -> Observable<UserModel?> in
                // here we should get user from server, realm or something
                let model = UserModel(name: "Carol", surname: "Black", avatar: UIImage(named: "user1")!, city: "Seattle", country: "USA")
                return .just(model)
            }
            .asDriver(onErrorJustReturn: nil)
    }
}
