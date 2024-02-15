//
//  CTUserModel.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import ObjectMapper

class CTUserItem: NSObject, Mappable, Codable {
    var cc_id: String?
    var userId: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        cc_id <- map["id"]
        userId <- map["userId"]
    }
}

class CTUserModel: NSObject, Mappable, Codable {
    var accessToken: String?
    var user: CTUserItem?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        accessToken <- map["accessToken"]
        user <- map["user"]
    }
}
