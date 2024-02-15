//
//  CTMoyaPlugin.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import Moya

struct TimeoutPlugin: PluginType {
    //MARK: - 这里target须为TargetType 不能修改为它的实际CTService
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        switch target {
        case CTService.login:
            request.timeoutInterval = 20
        default:
            request.timeoutInterval = 15
        }
        return request
    }
}
