//
//  BPUIAssistant.swift
//  AppBook
//
//  Created by wupeng on 2020/10/29.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit


let bp_screenWidth = UIScreen.main.bounds.width
let bp_screenHeight = UIScreen.main.bounds.height
let bp_screenScale = UIScreen.main.scale

let bp_screenWidthInPortrait = min(bp_screenWidth, bp_screenHeight)
let bp_screenHeightInPortrait = max(bp_screenWidth, bp_screenHeight)
let bp_screenWidthInLandscape = max(bp_screenWidth, bp_screenHeight)
let bp_screenHeightInLandscape = min(bp_screenWidth, bp_screenHeight)

let bp_screenCenterX = bp_screenWidth * 0.5;

let bp_statusBarFrame: CGRect = (UIApplication.shared.windows.first?.windowScene?.statusBarManager!.statusBarFrame)!

let bp_statusBarHeight = bp_statusBarFrame.height;

let bp_navigationBarHeight = CGFloat(44);

let bp_statusBarAndNavigationBarHeight = bp_statusBarHeight + bp_navigationBarHeight

let bp_tabBarHeight = CGFloat(bp_statusBarHeight > 20 ? 49 + 32 : 49)

let bp_pixel: CGFloat = {
    let pixel = CGFloat(1) / bp_screenScale
    return pixel
}()

let bp_keyWindow: UIWindow = {
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

let bp_safeAreaInsets: UIEdgeInsets  = {
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

func bp_topViewController() -> UIViewController? {
    return bp_topViewControllerOfWindow(bp_keyWindow) ?? nil
}

func bp_topViewControllerOfWindow(_ window: UIWindow?) -> UIViewController? {
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
