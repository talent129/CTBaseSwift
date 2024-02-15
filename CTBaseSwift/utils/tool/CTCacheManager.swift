//
//  CTCacheManager.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation

private let CTKey = "app.key"

class CTCacheManager {
    static var ctKey: String? {
        get {
            return UserDefaults.standard.string(forKey: CTKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: CTKey)
            UserDefaults.standard.synchronize()
        }
    }
}
