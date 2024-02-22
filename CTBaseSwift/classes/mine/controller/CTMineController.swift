//
//  CTMineController.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit

class CTMineController: CTBaseController {
    
    private
    lazy var testBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .random
        btn.layer.cornerRadius = adaptScreen(8)
        btn.layer.masksToBounds = true
        btn.setTitle("block", for: .normal)
        btn.setTitleColor(.random, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn.addTarget(self, action: #selector(testBtnClick), for: .touchUpInside)
        return btn
    }()
    
    private
    lazy var contentL: UILabel = {
        let l = UILabel()
        l.textColor = .random
        l.font = .systemFont(ofSize: 16, weight: .bold)
        l.numberOfLines = 0
        l.text = "Default"
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Mine"
        setupUI()
    }
    
    override func setupUI() {
        self.view.addSubview(self.testBtn)
        self.view.addSubview(self.contentL)
        
        self.testBtn.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(ScreenHeight/3.0)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        self.contentL.snp.makeConstraints { make in
            make.centerX.equalTo(self.testBtn)
            make.top.equalTo(self.testBtn.snp.bottom).offset(10)
        }
    }
}

extension CTMineController {
    @objc
    func testBtnClick() {
        let vc = CTMineSubController()
        
        vc.testBlock = { [weak self] idx in
            guard let this = self else { return }
            this.contentL.text = "回调" + String(idx)
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
