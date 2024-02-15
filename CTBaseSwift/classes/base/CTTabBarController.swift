//
//  CTTabBarController.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit

class CTTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tabBar.isTranslucent = false
        self.configStyle()
        self.configControllers()
        self.initUI()
    }
    
    private func initUI() {
        
        self.delegate = self
        
        configItem(index: 0, title: "Index", image: "tabbar_index_normal", selected: "tabbar_index_selected")
        configItem(index: 1, title: "Discovery", image: "tabbar_discovery_normal", selected: "tabbar_discovery_selected")
        configItem(index: 2, title: "Mine", image: "tabbar_mine_normal", selected: "tabbar_mine_selected")
    }
    
    private func configItem(index: Int, title: String, image: String, selected: String) {
        let item = self.tabBar.items?[index]
        item?.title = title
        
        if #available(iOS 13.0, *) {
            let appearance = tabBar.standardAppearance
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 10, weight: .medium), .foregroundColor: UIColor.descColor]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 10, weight: .semibold), .foregroundColor:UIColor.themeColor]
        } else {
            item?.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 10, weight: .medium), .foregroundColor: UIColor.descColor], for: .normal)
            item?.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 10, weight: .semibold), .foregroundColor:UIColor.themeColor], for: .selected)
        }
        
        item?.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        item?.selectedImage = UIImage(named: selected)?.withRenderingMode(.alwaysOriginal)
        
        //正: 向右或向下 负: 向左或向上
        let offset = UIOffset(horizontal: 0, vertical: -2)
        item?.titlePositionAdjustment = offset
    }
    
    private func configStyle() {
        // 顶部无黑线 白色
        if #available(iOS 13.0, *) {
            let appearance = tabBar.standardAppearance.copy()
            appearance.backgroundImage = UIImage(color: .white, size: CGSize(width: ScreenWidth, height: CTTabBarHeight))
            appearance.shadowImage = UIImage(color: UIColor(hexString: "#999999", transparency: 0.2)!, size: CGSize(width: ScreenWidth, height: 0.5))
            tabBar.standardAppearance = appearance
        } else {
            tabBar.isTranslucent = false
            tabBar.shadowImage = UIImage()
            tabBar.backgroundImage = UIImage()
        }
    }
    
    private func configControllers() {
        var controllers: [UIViewController] = []
        let indexVC = CTIndexController()
        let indexNav = CTBaseNavigationController(rootViewController: indexVC)
        controllers.append(indexNav)
        let discoveryVC = CTDiscoveryController()
        let discoveryNav = CTBaseNavigationController(rootViewController: discoveryVC)
        controllers.append(discoveryNav)
        let mineVC = CTMineController()
        let mineNav = CTBaseNavigationController(rootViewController: mineVC)
        controllers.append(mineNav)
        
        self.setViewControllers(controllers, animated: true)
    }
}

extension CTTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.viewControllers?.firstIndex(of: viewController) == 1 {
            print("点击了 index 1")
        }
        return true
    }
}

extension CTTabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == tabBar.items?[0] {
//            CTLog.debug("点击了第一个item")
        } else if item == tabBar.items?[1] {
//            CTLog.debug("点击了第二个item")
        } else if item == tabBar.items?[2] {
//            CTLog.debug("点击了第三个item")
        }
    }
}
