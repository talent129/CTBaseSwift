//
//  CTNet.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

enum CTNetStatusCode: Int {
    //success:200,success_but_null_data:201,params_error:400,token_error:401,server_error:500
    case SUCCESS = 200
    case NULLDATA = 201
    case PARAMSERROR = 400
    case TOKENINVALID = 401
    case SERVERERROR = 500
}

//MARK: -配置超时时间 闭包方式
let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<CTService>.RequestResultClosure) -> Void in
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 15
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

//MARK: -超时时间 插件形式
let timeoutPlugin = TimeoutPlugin()

//MARK: -插件
let activityPlugin = NetworkActivityPlugin { (changeType, targetType) in
    switch changeType {
    case .began:
        switch targetType.self {
        case CTService.reply:
            break
        default:
            CTHud.showLoading()
        }
    case .ended:
        CTHud.dismissLoading()
    }
}

/// 闭包形式设置超时时间
//let CTProvider = MoyaProvider<CTService>(endpointClosure: timeoutClosure,plugins: [activityPlugin])
/// 插件形式设置超时时间
let CTProvider = MoyaProvider<CTService>(plugins: [activityPlugin,timeoutPlugin])

struct CTNet {
    @discardableResult
    static func request(
        _ target: CTService,
        success successCallback:@escaping ((JSON) -> Void),
        error errorCallback:@escaping ((JSON) -> Void)
    ) -> Cancellable {
        
        return CTProvider.request(target, callbackQueue: DispatchQueue.main) { (result) in
            switch result {
            case let .success(response):
                let json = JSON(response.data);
                CTLog.info(target.path)
                CTLog.info(json)
                if json.isEmpty {
                    CTLog.debug("Please try again later")
                    return
                }
                
                if json["code"].intValue == CTNetStatusCode.SUCCESS.rawValue {
                    let data = JSON(json["data"])
                    successCallback(data)
                } else if json["code"].intValue == CTNetStatusCode.TOKENINVALID.rawValue {
                    CTLog.debug("😅 token token_error")
                    CTUserManager.clearInfo()
                    errorCallback(json);
                } else {
                    //如果数据获取失败，则返回错误状态码
                    if let msg = json["msg"].string {
                        CTLog.debug(msg)
                        errorCallback(json);
                    } else {
                        errorCallback(json);
                    }
                }
            case let .failure(error):
                switch error {
                case let .underlying(e, _):
                    if e.asAFError?.isExplicitlyCancelledError ?? false {
                        CTLog.debug("request is cancelled")
                        return
                    }
                default:
                    break
                }
//                CTHud.dismissLoading()
                CTLog.debug("--------\(error.localizedDescription)--------")
                CTLog.debug("Network error")
            }
        }
    }
}
