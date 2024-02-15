//
//  CTAppColorExt.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation
import SwifterSwift

extension UIColor {
    static var themeColor: UIColor {
        return UIColor(hexString: "#1A9BB1")!
    }
    
    static var themeWhite: UIColor { //white
        return UIColor(hexString: "#FFFFFF")!
    }
    
    static var themeBlack: UIColor { //black
        return UIColor(hexString: "#000000")!
    }
    
    static var textColor: UIColor {
        return UIColor(hexString: "#333333")!
    }
    
    static var secondaryColor: UIColor {
        return UIColor(hexString: "#666666")!
    }
    
    static var descColor: UIColor {
        return UIColor(hexString: "#999999")!
    }
    
    static var lineColor: UIColor {
        return UIColor(hexString: "#D8D8D8")!
    }
    
    static var backgroundColor: UIColor {
        return UIColor(hexString: "#F4F5F6")!
    }
}
