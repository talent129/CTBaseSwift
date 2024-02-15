//
//  CTHud.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import MBProgressHUD

struct CTHud {
    static func showLoading() {
        showLoading(onView: nil, "")
    }
    
    static func showLoading(onView: UIView?, _ message: String?) {
        //MARK: - moya的activityPlugin会在or.alamofire.session.rootQueue.requestQueue运行 UI操作需要在主线程 PS: 主线程(特殊的串行队列) + 异步线程 -> 不会开启新的线程 仍然在主线程运行
        DispatchQueue.main.async {
            guard let hudView = (onView ?? (UIApplication.shared.delegate as? AppDelegate)?.window) else {return}
            MBProgressHUD.hide(for: hudView, animated: true)
            
            let hud = MBProgressHUD.showAdded(to: hudView, animated: true)
            hud.minSize = CGSize(width: 70, height: 70)
//            hud.bezelView.layer.cornerRadius = 15
//            hud.offset = CGPoint(x: 0, y: -25)
            hud.isUserInteractionEnabled = true //禁止交互
            hud.removeFromSuperViewOnHide = true
            if message?.isEmpty == false {
                hud.label.text = message
            }
        }
    }
    
    static func dismissLoading() {
        dismissLoading(onView: nil)
    }
    
    static func dismissLoading(onView: UIView?) {
        
        DispatchQueue.main.async {
            guard let hudBackView = (onView ?? (UIApplication.shared.delegate as? AppDelegate)?.window) else {return}
            MBProgressHUD.hide(for: hudBackView, animated: true)
        }
    }
}
