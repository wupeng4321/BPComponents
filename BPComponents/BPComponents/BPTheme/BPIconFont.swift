//
//  ABIconFont.swift
//  AppBook
//
//  Created by wupeng on 2020/10/25.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit

public extension UIFont {
    ///初始化：iconFont
    class func iconfont(ofSize: CGFloat) -> UIFont? {
    //iconFont,对应我们导入的名字，size,就是图标大小
        return UIFont.init(name: "iconFont", size: ofSize)
    }
}

public extension UILabel {
    class func iconFont(from iconFont: String, size: CGFloat = 25, textColor: UIColor = .black) -> UILabel {
        let label = UILabel.init()
        label.text = iconFont
        label.textAlignment = .center
        label.font = UIFont.iconfont(ofSize: size)
        label.textColor = textColor
        return label
    }
}

public extension UIImage {
    
    /// 根据Unicode string 生成 字体图标 图片
    /// - Parameters:
    ///   - font: unicode string  例如 e65b
    ///   - textColor: 颜色
    ///   - backgroundColor: 背景色
    ///   - size: 图片大小
    convenience init(from font: String, textColor: UIColor = .black, backgroundColor: UIColor = .clear, size: CGSize) {
        let drawText = font
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        
        let fontSize = min(size.width / 1.28571429, size.height)
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.iconfont(ofSize: fontSize) as Any, .foregroundColor: textColor, .backgroundColor: backgroundColor, .paragraphStyle: paragraphStyle]
        
        let attributedString = NSAttributedString(string: drawText, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , UIScreen.main.scale)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }
    
    static func iconValue(from value: String, iconColor: UIColor = .black, imageSize: CGSize, ofSize size: CGFloat) -> UIImage {
        let drawText = value
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        
        drawText.draw(in: CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height), withAttributes: [.font: UIFont.iconfont(ofSize: size) as Any, .paragraphStyle: paragraphStyle, .foregroundColor: iconColor])
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
