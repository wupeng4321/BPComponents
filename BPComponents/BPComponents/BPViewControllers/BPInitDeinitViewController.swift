//
//  AllocDellocViewController.swift
//  jdapp
//
//  Created by wupeng on 2017/12/19.
//  Copyright © 2017年 wupeng. All rights reserved.
//

import Foundation
import UIKit
#if DEBUG
    var s_allocInfo : Dictionary<String, Int> = [:]
#endif

open class BPInitDeinitViewController: UIViewController {
    open override func viewDidLoad() {
        super .viewDidLoad()
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
        self.allocInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        #if DEBUG
        ABLog("\(NSStringFromClass(type(of: self)))----------------释放类----------------")
        let str:String = NSStringFromClass(type(of: self))
        if s_allocInfo[str] != nil {
            s_allocInfo[str] = s_allocInfo[str]! - 1
            if s_allocInfo[str] == 0 {
                s_allocInfo.removeValue(forKey: str)
            }
        }
        self.printAllocInfo()
        #endif
    }
    
    func allocInit() {
        #if DEBUG
        ABLog("\(NSStringFromClass(type(of: self)))----------------创建类----------------")

        let str:String = NSStringFromClass(type(of: self))
        if s_allocInfo[str] != nil {
            s_allocInfo[str] = s_allocInfo[str]! + 1
        } else {
            s_allocInfo[str] = 1
        }
        self.printAllocInfo()
        #endif
    }
    
    func printAllocInfo() {
        #if DEBUG
        var s_allocInfoStr = ""
        for (key, value) in s_allocInfo {
            s_allocInfoStr += "\(key) : \(value)\n"
        }
        ABLog(s_allocInfoStr)
            
        #endif
    }
}
