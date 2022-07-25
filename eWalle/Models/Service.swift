//
//  Model.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import Foundation
import UIKit

enum Service: CaseIterable {
    case sendMoney
    case reciveMoney
    case mobilePrepaid
    case electricityBill
    case cashbackOfer
    case movieTickets
    case flightTickets
    case moreOptions



    var title: String {
        switch self {
        case .sendMoney:
            return Strings.ServicesTitle.sendMoney.string()
        case .reciveMoney:
            return Strings.ServicesTitle.reciveMoney.string()
        case .mobilePrepaid:
            return Strings.ServicesTitle.mobilePrepaid.string()
        case .electricityBill:
            return Strings.ServicesTitle.electricityBill.string()
        case .cashbackOfer:
            return Strings.ServicesTitle.cashbackOfer.string()
        case .movieTickets:
            return Strings.ServicesTitle.movieTickets.string()
        case .flightTickets:
            return Strings.ServicesTitle.flightTickets.string()
        case .moreOptions:
            return Strings.ServicesTitle.moreOptions.string()
        }
    }

    var image: UIImage {
        switch self {
        case .sendMoney:
            return UIImage(named: "send_money")!
        case .reciveMoney:
            return UIImage(named: "receive_money")!
        case .mobilePrepaid:
            return UIImage(named: "mobile_prepaid")!
        case .electricityBill:
            return UIImage(named: "electricity_bill")!
        case .cashbackOfer:
            return UIImage(named: "cashback_offer")!
        case .movieTickets:
            return UIImage(named: "movie_tickets")!
        case .flightTickets:
            return UIImage(named: "flight_tickets")!
        case .moreOptions:
            return UIImage(named: "more_options")!
        }
    }
}
