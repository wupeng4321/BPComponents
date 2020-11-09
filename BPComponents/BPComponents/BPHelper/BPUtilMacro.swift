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
public func ABLog<T>(_ message:T, file:String = #file, lineNumber:Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]")
        print("\(message)")
        print("\n")
    #endif
}

public func ABLocalString(_ str:String) -> String {
    return NSLocalizedString(str, comment: "default")
}

public func bp_SafeDisplayStr(_ str:String?) ->String {
    return str ?? ""
}

public func bp_StrHasValue(_ str:String?) -> Bool {
    guard let str = str else {
        return false
    }
    return str.count > 0
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

public var kAppVersion   = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
public let kAppAdIdentifier = ASIdentifierManager.shared().advertisingIdentifier.uuidString

public let bp_padding = CGFloat(15)
public let bp_totalPadding = bp_padding * 2

public let ios9  = { () -> Bool in
    if #available(iOS 9.0, *) {
        return true
    }
    return false
}()
public let ios10 = { () -> Bool in
    if #available(iOS 10.0, *) {
        return true
    }
    return false
}()
public let ios11 = { () -> Bool in
    if #available(iOS 11.0, *) {
        return true
    }
    return false
}()

//public func NLSystemVersionGreaterOrEqualThan(version:Double) -> Bool {
//     UIDevice 在 macOS 中不存在，不能在所有平台上使用同样的代码路径
//     let versionStr = UIDevice.current.systemVersion
//     return Float(versionStr)! > Float(version)
//}

/// 计算label在确定UIFont下的长度,限label文字一行的情况
///
/// - Parameters:
///   - str: 字符串
///   - font: label的font
/// - Returns: 总长度
public func calculateWidth(str: String, font:UIFont) -> CGFloat {
    let str1 = NSString.init(string: str)
    return str1.size(withAttributes: [NSAttributedString.Key.font: font]).width
}

/// 计算label在确定UIfont下的CGSize,不限文字行数
///
/// - Parameters:
///   - text: 传入文本
///   - font: 传入UIFont
///   - size: optional CGSize
/// - Returns: label的CGSize
public func calculateSize(text:String, font: UIFont, size:CGSize?) -> CGRect {
    let maxSize = (size != nil) ? size! : CGSize(width: bp_screenWidth, height: CGFloat.greatestFiniteMagnitude)
    let attributes = [NSAttributedString.Key.font: font]
    let rect = NSString.init(string: text).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
    return rect
}


/// 计算label的宽度
///
/// - Parameter label: 传入label,label的文字和font需要已经设定
/// - Returns: label根据传入的的文字计算的宽度
public func calculateLabelWidth(_ label:UILabel) -> CGFloat {
    return calculateWidth(str: label.text! + " ", font: label.font!)
}

















