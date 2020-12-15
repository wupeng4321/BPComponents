//
//  UtilMacro.swift
//  jdapp
//
//  Created by wupeng on 2017/12/20.
//  Copyright © 2017年 wupeng. All rights reserved.
//

import Foundation
import UIKit
import AdSupport

//==========================================================================
//MARK - debug tools
//==========================================================================
public func BPLog<T>(_ message:T, file:String = #file, lineNumber:Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]")
        print("\(message)")
        print("\n")
    #endif
}

public func BPLocalString(_ str:String) -> String {
    return NSLocalizedString(str, comment: "default")
}

public func bp_isEmptyStr(_ strs:Any?...) -> Bool {
    for str in strs {
        let s = bp_safeStr(str)
        if s.count == 0 {
            return true
        }
    }
    return false
}

public func bp_safeStr(_ str:Any?) -> String {
    guard str != nil else { return "" }
    guard str is String else { return "" }
    return str as! String
}

public func bp_isEmptyArr(_ arr:Any?) -> Bool {
    guard arr != nil else { return true }
    guard arr is Array<Any> else {
        return true
    }
    guard (arr as! Array<Any>).count > 0  else {
        return true
    }
    return false
}

public func bp_isEmptyDic(_ dic:Any?) ->Bool {
    guard dic != nil else { return true }
    guard dic is Dictionary<String, Any> else {
        return true
    }
    guard (dic as! Dictionary<String, Any>).keys.count > 0  else {
        return true
    }
    return false
}

//==========================================================================
//MARK - color tools
//==========================================================================
public func ArcRandomColor() -> UIColor {
    let red:CGFloat   = CGFloat(arc4random() % 255) / 255.0
    let green:CGFloat = CGFloat(arc4random() % 255) / 255.0
    let blue:CGFloat  = CGFloat(arc4random() % 255) / 255.0
    return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
}

public func Color(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat) -> UIColor {
    return ColorA(red, green, blue, 1.0)
}

public func ColorA(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat, _ alpha:CGFloat) -> UIColor {
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

public func ColorFromRGB(_ hexColor:Int) -> UIColor {
    return ColorFromRGBA(hexColor, 1.0)
}

public func ColorFromRGBA(_ hexColor:Int, _ alpha:CGFloat) -> UIColor {
    let red   = CGFloat((hexColor & 0xff0000) >> 16)
    let green = CGFloat((hexColor & 0xff00) >> 8)
    let blue  = CGFloat(hexColor & 0xff)
    return ColorA(red / 255.0, green / 255.0, blue / 255.0, alpha)
}

//==========================================================================
//MARK - screen size tools
//==========================================================================

public var bp_appVersion   = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
public let bp_appAdIdentifier = ASIdentifierManager.shared().advertisingIdentifier.uuidString

public let bp_ios8   = BPSystemVersionGreaterThanOrEqualTo(8.0)
public let bp_ios9   = BPSystemVersionGreaterThanOrEqualTo(9.0)
public let bp_ios10  = BPSystemVersionGreaterThanOrEqualTo(10.0)
public let bp_ios11  = BPSystemVersionGreaterThanOrEqualTo(11.0)
public let bp_ios12  = BPSystemVersionGreaterThanOrEqualTo(12.0)
public let bp_ios13  = BPSystemVersionGreaterThanOrEqualTo(13.0)
public let bp_ios14  = BPSystemVersionGreaterThanOrEqualTo(14.0)

public func BPSystemVersionGreaterThanOrEqualTo(_ version:Double) -> Bool {
//     UIDevice 在 macOS 中不存在，不能在所有平台上使用同样的代码路径
     let versionStr = UIDevice.current.systemVersion
     return Float(versionStr)! > Float(version)
}
