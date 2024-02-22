//
//  AppDelegate.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//

import UIKit
import SwiftyBeaver
import IQKeyboardManagerSwift

let CTLog = SwiftyBeaver.self

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var allowOrentitaionRotation: Bool = false
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.configureWithDefaultBackground()
            app.backgroundColor = .themeColor
            app.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.themeWhite, NSAttributedString.Key.font: UIFont.systemFont(ofSize: adaptScreen(18), weight: .medium)]
            app.shadowImage = UIImage(color: UIColor.lineColor, size: CGSize(width: ScreenWidth, height: 0.6))
            app.shadowColor = UIColor.clear
            UINavigationBar.appearance().scrollEdgeAppearance = app
            UINavigationBar.appearance().standardAppearance = app
        }
        
        self.onInit()
        self.keyboard()
        self.configThird(application, launchOptions: launchOptions)
        
        let tabbar = CTTabBarController()
        self.window = UIWindow(frame: Bounds)
        self.window?.backgroundColor = UIColor.themeWhite
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        
//        Thread.sleep(forTimeInterval: 2)
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        CTLog.debug("enenen-allowOrentitaionRotation" + String(self.allowOrentitaionRotation))
        if self.allowOrentitaionRotation {
            return .allButUpsideDown
        } else {
            return .portrait
        }
    }
    
    private func onInit() {
        
    }
    
    private func keyboard() {
        
    }
    
    private func configThird(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // log
        let console = ConsoleDestination()  // log to Xcode Console
        // add the destinations to SwiftyBeaver
        CTLog.addDestination(console)
    }

}

