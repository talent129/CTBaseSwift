//
//  CTUserManager.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation

let tokenKey = "app.token"
let userKey = "app.user"

class CTUserManager {
    static var isLogin: Bool {
        guard let _ = self.user else { return false }
        return true
    }
    
    static var user: CTUserModel? {
        get {
            let decoder = JSONDecoder();
            if let userData = UserDefaults.standard.data(forKey: userKey),
                let u = try? decoder.decode(CTUserModel.self, from: userData) {
                return u;
            } else {
                return nil;
            }
        }
        set {
            if newValue == nil {
                UserDefaults.standard.set(nil, forKey: userKey);
                UserDefaults.standard.synchronize();
            } else {
                CTLog.debug("userId--->\(newValue?.user?.cc_id ?? "")")
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(newValue) {
                    CTLog.debug("呃呃呃呃呃")
                    UserDefaults.standard.set(encoded, forKey: userKey);
                    UserDefaults.standard.synchronize();
                }
            }
        }
    }
    
    static var userId:String {
        get{
            return self.user?.user?.cc_id ?? ""
        }
    }
    
    static var token:String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey);
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey);
            UserDefaults.standard.synchronize();
        }
    }
    
    static func clearInfo() {
        self.token = nil
        self.user = nil
    }
}
