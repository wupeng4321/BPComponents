//
//  BPBundle.swift
//  BPComponents
//
//  Created by wupeng on 2020/11/7.
//

import Foundation

class BPBundle: NSObject {
    static var bundle: Bundle = {
        var bundlePathStr: String = Bundle.init(for: BPBundle.classForCoder()).resourcePath!
        bundlePathStr = bundlePathStr + "/BPComponents.bundle"
        return Bundle.init(path: bundlePathStr)!
    }()
}
