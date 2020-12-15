//
//  String+Extension.swift
//  AppBook
//
//  Created by wupeng on 2020/10/24.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    var viewController: UIViewController {
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + self)! as! UIViewController.Type
        return cls.init()
    }
    
    /// "e606" -> "\u{e606}"
    func toUnicode() -> String {
        return Int(self, radix: 16).map{String(UnicodeScalar($0)!)}!
    }
    
    
    /// 计算单行最大宽
    /// - Parameter font: 自体
    /// - Returns: 单行最大宽
    func singleLineWidth(with font:UIFont) -> CGFloat {
        return self.bp_size(with: font, constrainedToWidth: CGFloat.greatestFiniteMagnitude).width
    }
    
    
    /// 计算string的size
    /// - Parameters:
    ///   - font: 自提
    ///   - constrainedToHeight: 最大高
    ///   - lineCount: 最大宽
    /// - Returns: string的size
    func bp_size(with font:UIFont, constrainedToHeight:CGFloat, lineCount:Int = 0) -> CGSize {
        var width = CGFloat(0)
        var height = CGFloat(0)
        
        if lineCount == 0 {
            let size = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude,height: constrainedToHeight),
                                         options:[.usesLineFragmentOrigin],
                                         attributes:[NSAttributedString.Key.font:font],
                                         context:nil).size
            width = size.width
            height = size.height
        } else {
            var testStr = ""
            for _ in 0 ..< lineCount {testStr += "X\n"}
            testStr.removeLast()
            
            let maxSize = testStr.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude,height: constrainedToHeight),
                                               options:[.usesLineFragmentOrigin],
                                               attributes:[NSAttributedString.Key.font:font],
                                               context:nil).size
            let textSize = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: constrainedToHeight),
                                             options:[.usesLineFragmentOrigin],
                                             attributes:[NSAttributedString.Key.font:font],
                                             context:nil).size
            
            width = textSize.width
            height = min(maxSize.height, textSize.height)
        }
        
        return CGSize.init(width: width, height: height)
    }
    
    
    /// 计算string的size
    /// - Parameters:
    ///   - font: 自提
    ///   - constrainedToWidth: 最大宽
    ///   - lineCount: 最大行数
    /// - Returns: string的size
    func bp_size(with font:UIFont, constrainedToWidth:CGFloat, lineCount:Int = 0) -> CGSize {
        var width = CGFloat(0)
        var height = CGFloat(0)
        
        if lineCount == 0 {
            let size = self.boundingRect(with: CGSize.init(width: constrainedToWidth,height: CGFloat.greatestFiniteMagnitude),
                                         options:[.usesLineFragmentOrigin],
                                         attributes:[NSAttributedString.Key.font:font],
                                         context:nil).size
            width = size.width
            height = size.height
        } else {
            var testStr = ""
            for _ in 0 ..< lineCount {testStr += "X\n"}
            testStr.removeLast()
            
            let maxSize = testStr.boundingRect(with: CGSize.init(width: constrainedToWidth,height: CGFloat.greatestFiniteMagnitude),
                                               options:[.usesLineFragmentOrigin],
                                               attributes:[NSAttributedString.Key.font:font],
                                               context:nil).size
            let textSize = self.boundingRect(with: CGSize.init(width: constrainedToWidth, height: CGFloat.greatestFiniteMagnitude),
                                             options:[.usesLineFragmentOrigin],
                                             attributes:[NSAttributedString.Key.font:font],
                                             context:nil).size
            
            width = textSize.width
            height = min(maxSize.height, textSize.height)
        }
        return CGSize.init(width: width, height: height)
    }
}
