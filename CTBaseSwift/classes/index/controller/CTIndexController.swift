//
//  CTIndexController.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit
import ObjectMapper

private let cellID = String(describing: CTIndexCell.self)
class CTIndexController: CTBaseController {
    
    private
    lazy var tableView: UITableView = {
        let t = UITableView(frame: .zero, style: .grouped)
        t.backgroundColor = .backgroundColor
        t.separatorStyle = .none
        t.tableFooterView = UIView()
        t.keyboardDismissMode = .onDrag
        t.showsVerticalScrollIndicator = false
        t.showsHorizontalScrollIndicator = false
        t.estimatedRowHeight = 100
        t.rowHeight = UITableView.automaticDimension; //default is UITableViewAutomaticDimension
        t.delegate = self
        t.dataSource = self
        t.emptyDataSetDelegate = self
        t.emptyDataSetSource = self
        t.register(CTIndexCell.self, forCellReuseIdentifier: cellID)
        
        return t
    }()
    
    private var list: [CTIndexModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Index"
        setupUI()
        onRequest()
    }
    
    override func onRequest() {
        
        let list = [
            ["name":"Flagship", "amount":"$200.00"],
            ["name":"Opportunities", "amount":"$0.0"],
            ["name":"Offshore", "amount":"$0.0"],
            ["name":"Flagship", "amount":"$200.00"],
            ["name":"Opportunities", "amount":"$0.0"],
            ["name":"Offshore", "amount":"$0.0"],
            ["name":"Flagship", "amount":"$200.00"],
            ["name":"Opportunities", "amount":"$0.0"],
            ["name":"Offshore", "amount":"$0.0"],
            ["name":"Flagship", "amount":"$200.00"],
            ["name":"Opportunities", "amount":"$0.0"],
            ["name":"Offshore", "amount":"$0.0"],
            ["name":"Flagship", "amount":"$200.00"],
            ["name":"Opportunities", "amount":"$0.0"],
            ["name":"Offshore", "amount":"$0.0"],
            ["name":"Flagship", "amount":"$200.00"],
            ["name":"Opportunities", "amount":"$0.0"],
            ["name":"Offshore", "amount":"$0.0"]
        ]
        
        self.list = Mapper<CTIndexModel>().mapArray(JSONArray: list)
        tableView.reloadData()
    }
    
    override func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
}

extension CTIndexController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CTIndexCell
        cell.selectionStyle = .none
        // 4. 遵循代理
        cell.protocolDelegate = self
        cell.model = self.list[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CTLog.debug(indexPath)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

extension CTIndexController: CTIndexCellProtocol {
    func cellBtnClick() {
        CTLog.debug("代理方法实现")
    }
}
