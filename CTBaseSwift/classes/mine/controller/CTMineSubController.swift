//
//  CTMineSubController.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/22.
//  Copyright © 2024 CT. All rights reserved.
//

import UIKit

class CTMineSubController: CTBaseController {
    
    // 定义回调
    typealias MineTestBlock = (_ idx: Int) -> Void
    var testBlock: MineTestBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 点击屏幕
        CTLog.debug("点击屏幕")
        let int = Int.random(in: 0...2024)
        self.testBlock?(int)
        self.navigationController?.popViewController(animated: true)
    }
}
