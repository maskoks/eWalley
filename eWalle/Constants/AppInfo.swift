//
//  AppInfo.swift
//  eWalle
//
//  Created by Жеребцов Данил on 23.07.2022.
//

import UIKit

enum AppInfo {
    static let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    static let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    static let iOSVersion = UIDevice.current.systemVersion
}
