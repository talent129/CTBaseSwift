//
//  CTDemoModel.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit
import ObjectMapper

class CTDemoModel: NSObject, Mappable {
    var title: String?
    var content: String?
    var time: String?
    
    required init(map: Map) {}
    override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        content <- map["content"]
        time <- map["time"]
    }
}
