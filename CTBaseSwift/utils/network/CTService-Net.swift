//
//  CTService-Net.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import Moya

extension CTService: TargetType {
    
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .login:
            return CTApi.login
        case .list:
            return CTApi.list
        case .reply:
            return CTApi.reply
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case let .login(data):
            return .requestParameters(parameters: data, encoding: JSONEncoding.default)
        case let .list(page, size):
            return .requestParameters(parameters: ["current": page, "size": size], encoding: URLEncoding.queryString)
        case let .reply(page, size, id):
            return .requestParameters(parameters: ["current": page, "size": size, "id": id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        CTLog.debug("header")
        if let token = CTUserManager.user?.accessToken {
            return ["Content-type": "application/json", "Authorization" : ("Bearer " + token)]
        }
        return ["Content-type": "application/json"]
    }
    
    var validate: Bool {
        return false
    }
}
