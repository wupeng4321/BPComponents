//
//  NSAttributedString+BP.swift
//  BPComponents
//
//  Created by wupeng on 2020/12/15.
//

import Foundation

public extension NSAttributedString {
    /// 计算AttributedString的高度
    /// - Parameters:
    ///   - font: 字体
    ///   - lineSpacing: 行间距
    ///   - firstLineHeadIndent: 头行间距
    ///   - constrainedToWidth: 最大宽
    ///   - lineCount: 最大行数
    /// - Returns: AttributedString的高度
    func bp_height(with font:UIFont, lineSpacing:CGFloat, firstLineHeadIndent:CGFloat, constrainedToWidth:CGFloat, lineCount:Int) -> CGFloat {
        if self.length == 0 {return 0}
        var attributes: [NSAttributedString.Key: Any] = NSMutableDictionary.init() as! [NSAttributedString.Key : Any]
        attributes[.font] = font
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.firstLineHeadIndent = firstLineHeadIndent
        attributes[.paragraphStyle] = paragraphStyle
        
        let attributedString = NSMutableAttributedString.init(attributedString: self)
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: self.length))
        
        var maxHeight = font.lineHeight * CGFloat(lineCount) + lineSpacing * CGFloat(lineCount - 1);
        if (lineCount == 0) {
            maxHeight = CGFloat.greatestFiniteMagnitude;
        }
        return attributedString.bp_size(constrainedToWidth: constrainedToWidth, constrainedToHeight: maxHeight).height
        
    }
    
    
    /// 计算attributedString的size
    /// - Parameters:
    ///   - attributedString: attributedString
    ///   - constrainedToWidth: 最大宽
    ///   - constrainedToHeight: 最大高
    /// - Returns: attributedString的size
    func bp_size(constrainedToWidth:CGFloat = .greatestFiniteMagnitude, constrainedToHeight:CGFloat = .greatestFiniteMagnitude) -> CGSize {
        let size = self.boundingRect(with: CGSize.init(width: constrainedToWidth, height: constrainedToHeight), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return CGSize.init(width: size.width, height: size.height)
    }
}
