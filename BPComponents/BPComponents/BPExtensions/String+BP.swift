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
    
    func singleLineWidth(with font:UIFont) -> CGFloat {
        return self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.leastNormalMagnitude),
                                 options:[.usesLineFragmentOrigin],
                                 attributes:[NSAttributedString.Key.font:font],
                                 context:nil).size.width
    }
    
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
            for _ in self {testStr += "X\n"}
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
