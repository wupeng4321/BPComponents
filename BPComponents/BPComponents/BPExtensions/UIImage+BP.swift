//
//  UIImage+BP.swift
//  AppBook
//
//  Created by wupeng on 2020/11/3.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import ImageIO

public extension UIImage {
    static func imageWithColor(_ color: UIColor) -> UIImage {
        self.imageWithColor(color, CGSize.init(width: 1, height: 1))
    }
    
    static func imageWithColor(_ color: UIColor, _ size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        color.set()
        
        context!.fill(CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndPDFContext()
        return image
        
    }
}
