//
//  CTTool.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import UIKit

protocol CTToolProtocol {
    // MARK: -计算文本size
    static func calculateLabelSize(str:String, size:CGSize, font:UIFont) -> CGSize
    // MARK: -计算单行文本size
    static func calculateSingleLabelSize(str: String, font:UIFont) -> CGSize
    
    static func notificationEnabled(handle: @escaping (Bool) -> Void)
}

extension CTToolProtocol {
    static func calculateLabelSize(str:String, size:CGSize, font:UIFont) -> CGSize {
        return NSString(string: str).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
    
    static func calculateSingleLabelSize(str: String, font:UIFont) -> CGSize {
        return NSString(string: str).size(withAttributes: [NSAttributedString.Key.font : font])
    }
    
    static func notificationEnabled(handle: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                if settings.authorizationStatus == .authorized {
                    handle(true)
                } else {
                    handle(false)
                }
            }
        }
    }
}

struct EWTool: CTToolProtocol {}
