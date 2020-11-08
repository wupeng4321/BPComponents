//
//  AppBook.swift
//  AppBook
//
//  Created by wupeng on 2017/12/20.
//  Copyright © 2017年 wupeng. All rights reserved.
//

import Foundation
import UIKit

open class Theme: NSObject {
    public class func padding(_ size:CGFloat) -> CGFloat {
        return size * bp_screenScale
    }
    
    public class func font(_ size:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    /// 0.0 white
    public static var colorBlack: UIColor      = ColorFromRGB(0x000000)
    /// 0.333 white
    public static var colorDarkGray: UIColor   = ColorFromRGB(0x555555)
    /// 0.667 white
    public static var colorLightGray: UIColor  = ColorFromRGB(0xaaaaaa)
    /// 1.0 white
    public static var colorWhite: UIColor      = ColorFromRGB(0xffffff)
    /// 0.5 white
    public static var colorGray: UIColor       = ColorFromRGB(0x7f7f7f)
    /// 1.0, 0.0, 0.0 RGB
    public static var colorRed: UIColor        = ColorFromRGB(0xff0000)
    /// 0.0, 1.0, 0.0 RGB
    public static var colorGreen: UIColor      = ColorFromRGB(0x00ff00)
    /// 0.0, 0.0, 1.0 RGB
    public static var colorBlue: UIColor       = ColorFromRGB(0x0000ff)
    /// 0.0, 1.0, 1.0 RGB
    public static var colorCyan: UIColor       = ColorFromRGB(0x00ffff)
    /// 1.0, 1.0, 0.0 RGB
    public static var colorYellow: UIColor     = ColorFromRGB(0xffff00)
    /// 1.0, 0.0, 1.0 RGB
    public static var colorMagenta: UIColor    = ColorFromRGB(0xff00ff)
    /// 1.0, 0.5, 0.0 RGB
    public static var colorOrange: UIColor     = ColorFromRGB(0xff7f00)
    /// 0.5, 0.0, 0.5 RGB
    public static var colorPurple: UIColor     = ColorFromRGB(0x7f007f)
    /// 0.6, 0.4, 0.2 RGB
    public static var colorBrown: UIColor      = ColorFromRGB(0x996633)
    /// 0.0 white, 0.0 alpha
    public static var colorClear: UIColor      = ColorFromRGBA(0x000000, 0)
    

    public static var colorTheme: UIColor      = ColorFromRGB(0x3377ff)
    
    /// 用于一级文字信息(如商品名称 功能列表入口) 0x333333
    public static var colorText: UIColor           = ColorFromRGB(0x333333)
    /// 用于二级文字信息(如数据名称 品牌列表标题) 0x666666*/
    public static var colorDimGray: UIColor        = ColorFromRGB(0x666666)
    /// 用于辅助文字信息(如异常文字提示 置灰样式) 0x999999
    public static var colorDetailText: UIColor     = ColorFromRGB(0x999999)
    /// 模块通栏分割线 0xe0e0e0
    public static var colorSeparatorLine: UIColor  = ColorFromRGB(0xeaeaea)
    /// 用于说明文字信息(如输入提示 列表时间信息) 0x787878*/
    public static var colorLightInfoGray: UIColor  = ColorFromRGB(0xd1d1d1)
    /// 圆形进度条背景景色
    public static var colorProcessBackground: UIColor = ColorFromRGB(0xEBF4F0)
    /// 圆形进度条前景色
    public static var colorProcessTint: UIColor = ColorFromRGB(0xFAC8A5)
    /// 背景色
    public static var colorBackground: UIColor = ColorFromRGB(0xf5f5f5)
    /// 用于按钮不可用状态颜色
    public static var colorDisableButton: UIColor = ColorFromRGB(0xcccccc)
    
    
    //================================================================
    //MARK - font
    //================================================================
    public static var font1:UIFont   = Theme.font(1)
    public static var font2:UIFont   = Theme.font(2)
    public static var font3:UIFont   = Theme.font(3)
    public static var font4:UIFont   = Theme.font(4)
    public static var font5:UIFont   = Theme.font(5)
    public static var font6:UIFont   = Theme.font(6)
    public static var font7:UIFont   = Theme.font(7)
    public static var font8:UIFont   = Theme.font(7)
    public static var font9:UIFont   = Theme.font(9)
    
    public static var font10:UIFont   = Theme.font(10)
    public static var font11:UIFont   = Theme.font(11)
    public static var font12:UIFont   = Theme.font(12)
    public static var font13:UIFont   = Theme.font(13)
    public static var font14:UIFont   = Theme.font(14)
    public static var font15:UIFont   = Theme.font(15)
    public static var font16:UIFont   = Theme.font(16)
    public static var font17:UIFont   = Theme.font(17)
    public static var font18:UIFont   = Theme.font(18)
    public static var font19:UIFont   = Theme.font(19)
    public static var font20:UIFont   = Theme.font(20)
    public static var font21:UIFont   = Theme.font(21)
    public static var font22:UIFont   = Theme.font(22)
    public static var font23:UIFont   = Theme.font(23)
    public static var font24:UIFont   = Theme.font(24)
    public static var font25:UIFont   = Theme.font(25)
    public static var font26:UIFont   = Theme.font(26)
    public static var font27:UIFont   = Theme.font(27)
    public static var font28:UIFont   = Theme.font(28)
    public static var font29:UIFont   = Theme.font(29)
    public static var font30:UIFont   = Theme.font(30)
    public static var font31:UIFont   = Theme.font(31)
    public static var font32:UIFont   = Theme.font(32)
    public static var font33:UIFont   = Theme.font(33)
    public static var font34:UIFont   = Theme.font(34)
    public static var font35:UIFont   = Theme.font(35)
    public static var font36:UIFont   = Theme.font(36)
    public static var font37:UIFont   = Theme.font(37)
    public static var font38:UIFont   = Theme.font(38)
    public static var font39:UIFont   = Theme.font(39)
    public static var font40:UIFont   = Theme.font(40)
}

public extension UIView {
    func bp_backgroundColor() {
       #if DEBUG
        self.backgroundColor = ArcRandomColor()
       #endif
    }
}
