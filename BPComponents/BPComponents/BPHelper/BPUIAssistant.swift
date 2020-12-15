//
//  BPUIAssistant.swift
//  AppBook
//
//  Created by wupeng on 2020/10/29.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit


public let bp_screenWidth = UIScreen.main.bounds.width
public let bp_screenHeight = UIScreen.main.bounds.height
public let bp_screenScale = UIScreen.main.scale

public let bp_screenWidthInPortrait = min(bp_screenWidth, bp_screenHeight)
public let bp_screenHeightInPortrait = max(bp_screenWidth, bp_screenHeight)
public let bp_screenWidthInLandscape = max(bp_screenWidth, bp_screenHeight)
public let bp_screenHeightInLandscape = min(bp_screenWidth, bp_screenHeight)

public let bp_screenCenterX = bp_screenWidth * 0.5;

public let bp_statusBarFrame: CGRect = (UIApplication.shared.windows.first?.windowScene?.statusBarManager!.statusBarFrame)!

public let bp_statusBarHeight = bp_statusBarFrame.height;

public let bp_navigationBarHeight = CGFloat(44);

public let bp_statusBarAndNavigationBarHeight = bp_statusBarHeight + bp_navigationBarHeight

public let bp_tabBarHeight = CGFloat(bp_statusBarHeight > 20 ? 49 + 32 : 49)

public let bp_normalContentInset = UIEdgeInsets.init(top: 12, left: 15, bottom: 12, right: 15) /// normal content inset
public let bp_padding_v = bp_normalContentInset.left /// normal horizontal padding
public let bp_padding_h = bp_normalContentInset.top /// normal vertical padding
public let bp_totalPadding_h = bp_padding_v * 2
public let bp_totalPadding_v = bp_padding_h * 2

public let bp_pixel: CGFloat = {
    let pixel = CGFloat(1) / bp_screenScale
    return pixel
}()

public let bp_keyWindow: UIWindow = {
    if #available(iOS 13.0, *) {
        for scene in UIApplication.shared.connectedScenes {
            for window in (scene as! UIWindowScene).windows {
                if (window.isKeyWindow) {
                    return window;
                }
            }
        }
    }
    
    let selector: Selector = NSSelectorFromString("window")
    if (UIApplication.shared.delegate?.responds(to: selector))! {
        return (UIApplication.shared.delegate?.window!)!;
    }
    
    for window in UIApplication.shared.windows {
        if (window.isKeyWindow) {
            return window;
        }
    }
    return UIWindow.init()
}()

public let bp_safeAreaInsets: UIEdgeInsets  = {
    let selector: Selector = NSSelectorFromString("safeAreaInsets")
    if (UIView.responds(to: selector)) {
        if #available(iOS 11.0, *) {
            let keyWindow: UIWindow = bp_keyWindow
            var insets = keyWindow.safeAreaInsets;
            insets.top = insets.top <= 40 ? insets.top : CGFloat(0)
            return insets
        }
    }
    return UIEdgeInsets.zero;
}()

public func bp_topViewController() -> UIViewController? {
    return bp_topViewController(of: bp_keyWindow) ?? nil
}

public func bp_topViewController(of window: UIWindow?) -> UIViewController? {
    guard window != nil else { return nil }
    var result = window?.rootViewController
    guard result != nil  else { return nil }
    
    while result != nil {
        if result?.presentingViewController != nil && !(result?.presentedViewController!.isBeingDismissed)! {
            result = result?.presentedViewController!
            continue
        }
        if ((result?.isKind(of: UITabBarController.classForCoder()))!) {
            let tabBarController = result as! UITabBarController?;
            let selectedViewController = tabBarController?.selectedViewController;
            if (selectedViewController == nil) {
                break;
            }
            result = selectedViewController;
            continue;
        }
        if ((result?.isKind(of: UINavigationController.classForCoder()))!) {
            let navigationController = result as! UINavigationController;
            let topViewController = navigationController.topViewController;
            if (topViewController == nil) {
                break;
            }
            result = topViewController;
            continue;
        }
        break;
    }
    return result
}
