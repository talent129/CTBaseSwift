//
//  CTService.swift
//  CTBaseSwift
//
//  Created by Curtis on 2024/2/15.
//  Copyright © 2024 CT. All rights reserved.
//

import Foundation

enum CTService {
    case login(data: [String: String])
    case list(page: Int, size: Int)
    case reply(page: Int, size: Int, id: String)
}
