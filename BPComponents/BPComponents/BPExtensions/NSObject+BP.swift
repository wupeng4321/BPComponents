//
//  NSObject+BPExtension.swift
//  AppBook
//
//  Created by wupeng on 2020/11/2.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit

public extension NSObject {
    static var bp_classString: String {
        return NSStringFromClass(self.classForCoder())
    }
}
