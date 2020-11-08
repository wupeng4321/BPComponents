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
        return self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.leastNormalMagnitude), options:[], attributes:[NSAttributedString.Key.font:font], context:nil).size.width
    }
}
