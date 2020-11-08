//
//  BPNavigationController.swift
//  AppBook
//
//  Created by wupeng on 2020/10/23.
//  Copyright © 2020 wupeng. All rights reserved.
//

import UIKit

open class BPNavigationController: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
