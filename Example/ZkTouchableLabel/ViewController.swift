//
//  ViewController.swift
//  ZkTouchableLabel
//
//  Created by ziank on 01/04/2019.
//  Copyright (c) 2019 ziank. All rights reserved.
//

import UIKit
import ZkTouchableLabel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString())
        attributedString.append(NSAttributedString(string: "首先小字", attributes: [.font: UIFont.boldSystemFont(ofSize: 15)]))
        attributedString.append(NSAttributedString(string: "接者大字", attributes: [.font: UIFont.boldSystemFont(ofSize: 22)]))
        attributedString.append(NSAttributedString(string: "然后小一点", attributes: [.font: UIFont.boldSystemFont(ofSize: 17)]))

        let label = UILabel()
        label.attributedText = attributedString
        label.frame = CGRect(x: 100, y: 100, width: 300, height: 50)

        view.addSubview(label)
        label.setZkTapBlock { (index, attributedString) in
            if index > -1 {
                print("点击了第\(index + 1)个字：\"\(attributedString.string)\"")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

