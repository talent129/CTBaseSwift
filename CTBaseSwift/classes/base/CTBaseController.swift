//
//  CTBaseController.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit
import DZNEmptyDataSet

class CTBaseController: UIViewController {
    
    private var refreshing = false
    var page: Int = 1
    
    lazy var ct_header: MJRefreshNormalHeader = {
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(onRefresh))
        return header
    }()
    
//    lazy var ct_footer: MJRefreshAutoNormalFooter = {
//        let f = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(onLoadMore))
//        return f
//    }()
    lazy var ct_footer: MJRefreshBackNormalFooter = {
        let f = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(onLoadMore))
        return f
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit {
        CTLog.debug("deinit \(type(of: self))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .themeWhite
        
        self.configNavStyle()
        self.initUI()
    }
    
    func setupUI() {
        
    }
    
    private func initUI() {
        self.view.backgroundColor = UIColor.themeWhite
        self.rt_disableInteractivePop = false
    }
    
    private func configNavStyle() {
        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.configureWithDefaultBackground()
            app.backgroundColor = .themeColor
            app.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.themeWhite, NSAttributedString.Key.font: UIFont.systemFont(ofSize: adaptScreen(18), weight: .medium)]
            app.shadowImage = UIImage(color: UIColor.lineColor, size: CGSize(width: ScreenWidth, height: 0.6))
            app.shadowColor = UIColor.clear
            UINavigationBar.appearance().scrollEdgeAppearance = app
            UINavigationBar.appearance().standardAppearance = app
        } else {
            self.navigationController?.navigationBar.barTintColor = .themeColor // 背景色
            self.navigationController?.navigationBar.tintColor = .white // 返回按钮色
            self.navigationController?.navigationBar.isTranslucent = false
            //显示下边缘线
            self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.lineColor, size: CGSize(width: ScreenWidth, height: 0.6))
            //去掉下边缘线
    //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) // 背景图片
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: adaptScreen(18), weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.themeColor]
        }
    }
    
    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        let btn = UIButton(type: .custom)
        btn.contentHorizontalAlignment = .left
        btn.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        btn.setImage(UIImage.init(named: "nav_back_black")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return UIBarButtonItem(customView: btn)
    }
    
    @objc
    func onBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func onRequest() {
        
    }
    
    @objc
    func onRefresh() {
        CTLog.debug("onRefresh")
        if refreshing {
            return
        }
        self.page = 1
        refreshing = true
        onRequest()
    }
    
    @objc
    func onLoadMore() {
        CTLog.debug("onLoadMore")
        if refreshing {
            return
        }
        self.page += 1
        refreshing = true
        onRequest()
    }
    
    func onEndRefresh() {
        ct_header.endRefreshing()
        ct_footer.endRefreshing()
        refreshing = false
    }
}

extension CTBaseController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "icon_list_empty")
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return UIColor.themeWhite
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "There's nothing in here~"
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -100
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
}
