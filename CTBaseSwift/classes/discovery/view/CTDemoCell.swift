//
//  CTDemoCell.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit

class CTDemoCell: UITableViewCell {
    private var titleL: UILabel!
    private var contentL: UILabel!
    private var timeL: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .themeWhite
        self.setupUI()
    }
    
    private func setupUI() {
        self.titleL = UILabel()
        self.titleL.textColor = .random
        self.titleL.font = UIFont.systemFont(ofSize: adaptScreen(16), weight: .regular)
        self.contentView.addSubview(self.titleL)
        self.titleL.snp.makeConstraints { (make) in
            make.leading.equalTo(adaptScreen(24))
            make.top.equalTo(adaptScreen(15))
            make.trailing.equalTo(adaptScreen(-24))
        }
        
        self.contentL = UILabel()
        self.contentL.numberOfLines = 2
        self.contentL.textColor = UIColor.random
        self.contentL.font = UIFont.systemFont(ofSize: adaptScreen(14), weight: .regular)
        self.contentView.addSubview(self.contentL)
        self.contentL.snp.makeConstraints { (make) in
            make.leading.equalTo(adaptScreen(24))
            make.top.equalTo(self.titleL.snp.bottom).offset(adaptScreen(6))
            make.trailing.equalTo(adaptScreen(-24))
        }
        
        self.timeL = UILabel()
        self.timeL.textColor = .random
        self.timeL.font = UIFont.systemFont(ofSize: adaptScreen(14), weight: .regular)
        self.contentView.addSubview(self.timeL)
        self.timeL.snp.makeConstraints { (make) in
            make.leading.equalTo(adaptScreen(24))
            make.top.equalTo(self.contentL.snp.bottom).offset(adaptScreen(6))
            make.bottom.equalTo(adaptScreen(-15))
        }
    }
    
    func show(model:CTDemoModel) {
        self.titleL.text = model.title
        self.contentL.text = model.content
        self.timeL.text = model.time
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
