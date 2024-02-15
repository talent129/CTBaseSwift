//
//  CTDiscoveryController.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit
import ObjectMapper

private let demoCellId = String(describing: CTDemoCell.self)
class CTDiscoveryController: CTBaseController {
    
    private var tableView: UITableView!
    private var list: [CTDemoModel] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Discovery"
        self.setupUI()
        self.onRefresh()
    }
    
    override func setupUI() {
        super.setupUI()
        self.tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView.backgroundColor = .themeWhite
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(CTDemoCell.self, forCellReuseIdentifier: demoCellId)
        self.tableView.mj_header = self.ct_header
        self.tableView.mj_footer = self.ct_footer
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    override func onRequest() {
        super.onRequest()
        
        if let path = Bundle.main.path(forResource: "poemList.plist", ofType: nil) {
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                let list = Mapper<CTDemoModel>().mapArray(JSONObject: array) ?? []
                self.list.append(contentsOf: list)
                self.tableView.reloadData()
                self.onEndRefresh()
            }
        }
        
        // dic转model
        // let user = CTLoginUserModel(JSON:data.dictionaryObject ?? [:])
        
//        CTNet.request(.list(page: self.page, size: 10)) { [weak self] (data) in
//            guard let this = self else {return}
//            this.onEndRefresh()
//            let total = data["total"].intValue
//            let list = Mapper<CTDemoModel>().mapArray(JSONObject: data["records"].arrayObject) ?? []
//            
//            if (this.page == 1) {
//                this.list.removeAll()
//            }
//            this.list.append(contentsOf: list)
//            if this.list.count >= total {
//                this.tableView.mj_footer = nil
//            } else {
//                this.tableView.mj_footer = this.ct_footer
//            }
//            this.tableView.reloadData()
//        } error: { [weak self] _ in
//            guard let this = self else {return}
//            this.onEndRefresh()
//        }
        
        
    }
}

//MARK: - tableView delegate
extension CTDiscoveryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: demoCellId) as! CTDemoCell
        cell.selectionStyle = .none
        let model = self.list[indexPath.row]
        cell.show(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CTLog.debug(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
