//
//  BPRouter.swift
//  AppBook
//
//  Created by wupeng on 2020/11/2.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit

private var routerDataKey: Void?
private var asyncBlockKey: Void?

public typealias AsyncBlock = (_ data:Any?) -> Void

public extension UIViewController {
    var routerData: AnyObject? {
        set {
            objc_setAssociatedObject(self, &routerDataKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &routerDataKey) as AnyObject
        }
    }
    
    var asyncBlock: AsyncBlock? {
        set {
            objc_setAssociatedObject(self, &asyncBlockKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
            
        }
        get {
            return objc_getAssociatedObject(self, &asyncBlockKey) as? AsyncBlock
        }
    }
}

