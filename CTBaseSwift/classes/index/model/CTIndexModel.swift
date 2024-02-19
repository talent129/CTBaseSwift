//
//  CTIndexModel.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/19.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit
import ObjectMapper

class CTIndexModel: NSObject, Mappable {
    
    var name: String?
    var amount: String?
    
    required init?(map: Map) {}
    override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        amount <- map["amount"]
    }
}
