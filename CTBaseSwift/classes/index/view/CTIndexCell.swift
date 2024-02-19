//
//  CTIndexCell.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/19.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit

class CTIndexCell: UITableViewCell {
    
    private
    lazy var nameL: UILabel = {
        let l = UILabel()
        l.textColor = .random
        l.font = UIFont.systemFont(ofSize: adaptScreen(14), weight: .medium)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    private
    lazy var amountL: UILabel = {
        let l = UILabel()
        l.textColor = .random
        l.font = UIFont.systemFont(ofSize: adaptScreen(14), weight: .semibold)
        l.textAlignment = .right
        l.numberOfLines = 0
        
        return l
    }()
    
    private
    lazy var lineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lineColor
        
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .backgroundColor
        setupUI()
    }
    
    private func setupUI() {
        self.contentView.addSubview(self.nameL)
        self.contentView.addSubview(self.amountL)
        self.contentView.addSubview(self.lineView)
        
        self.nameL.snp.makeConstraints { (make) in
            make.leading.equalTo(adaptScreen(24))
            make.top.equalTo(adaptScreen(15))
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.leading.equalTo(adaptScreen(24))
            make.top.equalTo(self.nameL.snp.bottom).offset(adaptScreen(15))
            make.width.equalTo(ScreenWidth - adaptScreen(48))
            make.height.equalTo(adaptScreen(1))
            make.bottom.equalTo(0)
        }
        
        self.amountL.snp.makeConstraints { (make) in
            make.trailing.equalTo(adaptScreen(-24))
            make.centerY.equalTo(self.nameL)
        }
    }
    
    // 属性观察器
    var model: CTIndexModel? {
        didSet {
            self.nameL.text = model?.name
            self.amountL.text = model?.amount
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
