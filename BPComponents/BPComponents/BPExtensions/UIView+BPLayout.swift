//
//  UIView+BPLayout.swift
//  AppBook
//
//  Created by wupeng on 2020/11/3.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    /// 移除所有子view
    func bp_removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    /// 添加一个数组的view
    /// - Parameter views: subViews数组
    func bp_addSubviews(_ subViews: [UIView]) {
        if subviews.count == 0 {return}
        for view in subviews {self.addSubview(view)}
    }
    
    /// 将当前view从父view带到最前面
    func bp_bringToFront() {
        self.superview?.bringSubviewToFront(self)
    }
    
    /// 将当前view从父view带到最后面
    func bp_sendToBack() {
        self.superview?.sendSubviewToBack(self)
    }
    
    var bp_x: CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        get {return self.frame.origin.x }
    }
    
    var bp_y: CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        get {return self.frame.origin.y}
    }
    
    var bp_width: CGFloat {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        get {return self.bounds.size.width}
    }
    
    var bp_height: CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get {return self.frame.size.height}
    }
    
    var bp_top: CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        get {return self.bounds.origin.y}
    }
    
    var bp_bottom: CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
        get {return self.frame.origin.y + self.frame.size.height}
    }
    
    var bp_left: CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        get {return self.frame.origin.x}
    }
    
    var bp_right: CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
        get {return self.frame.origin.x + self.frame.size.width}
    }
    
    var bp_origin: CGPoint {
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
        get {return self.frame.origin}
    }
    
    var bp_size: CGSize {
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
        get {return self.frame.size}
    }
    
    var bp_centerX: CGFloat {
        set {
            self.center = CGPoint.init(x: newValue, y: self.center.y)
        }
        get {return self.center.x}
    }
    
    var bp_centerY: CGFloat {
        set {
            self.center = CGPoint.init(x: self.center.x, y: newValue)
        }
        get {return self.center.y}
    }
    
    /// frame.origin.x + frame.size.width
    /// - Parameter maxX: maxX
    func bp_setMaxX(_ maxX: CGFloat) {
        var frame = self.frame;
        frame.size.width = maxX - frame.origin.x;
        self.frame = frame;
    }
    
    /// frame.origin.y + frame.size.height
    /// - Parameter maxY: maxY
    func bp_setMaxY(_ maxY: CGFloat) {
        var frame = self.frame;
        frame.size.height = maxY - frame.origin.y;
        self.frame = frame;
    }
    
    
    /// frame.origin.x + xOffset
    /// - Parameter offsetX: offsetX
    func bp_moveToOffsetX(_ offsetX: CGFloat) {
        var frame = self.frame;
        frame.origin.x += offsetX;
        self.frame = frame;
    }
    
    
    /// frame.origin.y + yOffset
    /// - Parameter offsetY: offsetY
    func bp_moveToOffsetY(_ offsetY: CGFloat) {
        var frame = self.frame;
        frame.origin.y += offsetY;
        self.frame = frame;
    }
    
    func bp_moveToCenterOfSuperview() {
        self.center = CGPoint.init(x: (self.superview!.bounds as CGRect).midX, y: (self.superview!.bounds as CGRect).midY)
    }
    
    func bp_moveToRight(_ right: CGFloat) {
        var frame = self.frame;
        frame.origin.x = right - frame.size.width;
        self.frame = frame;
    }
    
    func bp_convert(point:CGPoint, to viewOrWindow:Any?) -> CGPoint {
        if viewOrWindow == nil {
            if self is UIWindow {
                let window = self as! UIWindow
                return window.convert(point, to: window)
            } else {
                return self.convert(point, to: nil)
            }
        }
        
        var from:UIWindow?
        var to: UIWindow?
        
        if viewOrWindow is UIWindow {
            from = viewOrWindow as? UIWindow
        } else if (viewOrWindow is UIView) {
            from = (viewOrWindow as! UIView).window!
        }
        
        if self is UIWindow {
            to = self as? UIWindow
        } else {
            to = self.window!
        }
        
        guard from == nil || to == nil || from == to else {
            return self.convert(point, to: viewOrWindow as! UIView)
        }
        
        var r:CGPoint = point
        r = self.convert(point, to: to!)
        r = to!.convert(r, from: from)
        r = from!.convert(r, from: viewOrWindow as! UIView)
        return r
    }
    
    func bp_convert(point:CGPoint, from viewOrWindow:Any?) -> CGPoint {
        if viewOrWindow == nil {
            if self is UIWindow {
                let window = self as! UIWindow
                return window.convert(point, from: window)
            } else {
                return self.convert(point, from: nil)
            }
        }
        
        var from:UIWindow?
        var to: UIWindow?
        
        if viewOrWindow is UIWindow {
            from = viewOrWindow as? UIWindow
        } else if (viewOrWindow is UIView) {
            from = (viewOrWindow as! UIView).window!
        }
        
        if self is UIWindow {
            to = self as? UIWindow
        } else {
            to = self.window!
        }
        
        guard from == nil || to == nil || from == to else {
            return self.convert(point, from: viewOrWindow as! UIView)
        }
        
        var r:CGPoint = point
        r = from!.convert(r, from: viewOrWindow as! UIView)
        r = to!.convert(r, from: from)
        r = self.convert(point, from: to!)
        
        return r
        
    }
    
    func bp_convert(rect:CGRect, to viewOrWindow:Any?) -> CGRect {
        if viewOrWindow == nil {
            if self is UIWindow {
                let window = self as! UIWindow
                return window.convert(rect, to: window)
            } else {
                return self.convert(rect, to: nil)
            }
        }
        
        var from:UIWindow?
        var to: UIWindow?
        
        if viewOrWindow is UIWindow {
            from = viewOrWindow as? UIWindow
        } else if (viewOrWindow is UIView) {
            from = (viewOrWindow as! UIView).window!
        }
        
        if self is UIWindow {
            to = self as? UIWindow
        } else {
            to = self.window!
        }
        
        guard from == nil || to == nil || from == to else {
            return self.convert(rect, to: viewOrWindow as! UIView)
        }
        
        var r:CGRect = rect
        r = self.convert(rect, to: to!)
        r = to!.convert(r, from: from)
        r = from!.convert(r, from: viewOrWindow as! UIView)
        return r
    }
    
    func bp_convert(rect:CGRect, from viewOrWindow:Any?) -> CGRect {
        if viewOrWindow == nil {
            if self is UIWindow {
                let window = self as! UIWindow
                return window.convert(rect, from: window)
            } else {
                return self.convert(rect, from: nil)
            }
        }
        
        var from:UIWindow?
        var to: UIWindow?
        
        if viewOrWindow is UIWindow {
            from = viewOrWindow as? UIWindow
        } else if (viewOrWindow is UIView) {
            from = (viewOrWindow as! UIView).window!
        }
        
        if self is UIWindow {
            to = self as? UIWindow
        } else {
            to = self.window!
        }
        
        guard from == nil || to == nil || from == to else {
            return self.convert(rect, from: viewOrWindow as! UIView)
        }
        
        var r:CGRect = rect
        r = from!.convert(r, from: viewOrWindow as! UIView)
        r = to!.convert(r, from: from)
        r = self.convert(rect, from: to!)
        
        return r
        
    }
    
    func bp_snapshotWithScale(_ scale: CGFloat) -> UIImage {
        let size = self.bounds.size;
        UIGraphicsBeginImageContextWithOptions(size, true, scale);
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return resultImage;
    }
    
    func bp_makeRoundedRectangleShape() {
        let length = min(self.bp_width, self.bp_height)
        self.clipsToBounds = true
        self.layer.cornerRadius = length * 0.5
    }
    
    
    /// 设置边框颜色与圆角
    /// - Parameters:
    ///   - borderColor: 边框颜色
    ///   - cornerRadius: 圆角
    func bp_setBorderColor(_ borderColor: UIColor?, _ cornerRadius:CGFloat)  {
        guard borderColor != nil else {return}
        self.layer.borderColor = borderColor?.cgColor;
        self.layer.borderWidth = bp_pixel;
        self.layer.cornerRadius = cornerRadius;
    }
    
    
    /// 增加圆角
    /// - Parameters:
    ///   - corners: UIRectCorner
    ///   - radius: radius
    func bp_addRoundingCorners(corners: UIRectCorner, _ radius:CGFloat) {
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize.init(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.cgPath;
        self.layer.mask = maskLayer;
    }
    
    
    /// 查找自己所在viewController
    func bp_firstViewController() -> UIViewController {
        return self.bp_responder(cls: UIViewController.classForCoder())
            as! UIViewController
    }
    
    ///查找自己响应链上的view或viewController
    func bp_responder(cls: AnyClass) -> UIResponder? {
        var responder: UIResponder? = self
        while responder != nil {
            responder = responder?.next
            if (responder?.isKind(of: cls))! {
                return responder
            }
        }
        return nil
    }

}
