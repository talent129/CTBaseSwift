//
//  CTMacro.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation

///万能闭包回调传值
typealias CallObjectClosure<T> = (_ model:T) -> Void;

typealias CallArrClosure<T> = (_ arr:[T]) -> Void;

typealias CallIntClosure = (_ value:Int?) -> Void;

typealias CallStringClosure = (_ value:String?) -> Void;
