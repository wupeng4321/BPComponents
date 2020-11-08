//
//  Bundle+Extensions.swift
//  AppBook
//
//  Created by wupeng on 2020/10/24.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation

public extension Bundle {
    var nameSpace: String {
        return infoDictionary!["CFBundleName"] as? String ?? ""
    }
}
