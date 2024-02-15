//
//  CTConst.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import UIKit

let isProduction = false

let CTTestNotification  = Notification.Name(rawValue: "com.app.test")

let Bounds = UIScreen.main.bounds
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let CTAppName = Bundle.main.infoDictionary!["CFBundleName"] as! String

let CTStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
//导航栏高度
let CTNavigationHeight = 44

//tabbar高度
let CTTabBarHeight: CGFloat = (CTStatusBarHeight > 20 ? 83:49)

//顶部安全距离
let CTTopSafeAreaHeight = CTStatusBarHeight + CGFloat(CTNavigationHeight)

//底部安全距离
let CTBottomSafeAreaHeight = (CTTabBarHeight - 49)

//是否是iPhoneX
let CTIsIPhoneX = (CTStatusBarHeight > 20)

let EWWScale: CGFloat = ScreenWidth / 375.0
func adaptScreen(_ value: CGFloat) -> CGFloat {
    return value * EWWScale
}

let EWHScale: CGFloat = ScreenHeight / 812.0
func adaptHScreen(_ value: CGFloat) -> CGFloat {
    return value * EWHScale
}
