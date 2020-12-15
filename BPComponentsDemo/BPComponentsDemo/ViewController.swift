//
//  ViewController.swift
//  BPComponentsDemo
//
//  Created by wupeng on 2020/11/7.
//

import UIKit
import BPComponents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let str = "4thnh4thnh4thnh4tht12dfdfas2"
        var size = str.bp_size(with: Theme.font20, constrainedToWidth: 100, lineCount: 0)
//        size = str.bp_size(with: Theme.font20, constrainedToHeight: 200, lineCount: 2)
        let label = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: size.height))
        self.view.addSubview(label)
        label.text = str
        label.font = Theme.font20
        label.numberOfLines = 0
        label.backgroundColor = Theme.colorWithHex(0xff0000)
        
        let att = NSAttributedString.init(string: str, attributes: [NSAttributedString.Key.font: Theme.font28])
        
        label.bp_size = att.bp_size(constrainedToWidth:120)
        
        label.attributedText = att
    }


}

