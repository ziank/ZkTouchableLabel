//
//  UILabel+ZkLabelCategory.swift
//  ZkTouchableLabel
//
//  Created by ziank on 2019/1/4.
//

import UIKit

var kZkTapBlock = "Zk_TapBlock"
var kZkTextHelper = "Zk_TextHelper"

extension UILabel {
    var zkTextHelper: ZkTextHelper? {
        get {
            return objc_getAssociatedObject(self, &kZkTextHelper) as? ZkTextHelper
        }
        set {
            objc_setAssociatedObject(self, &kZkTextHelper, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public var zkTapBlock: ((Int, NSAttributedString) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &kZkTapBlock) as? ((Int, NSAttributedString) -> Void)
        }
        set {
            objc_setAssociatedObject(self, &kZkTapBlock, newValue, .OBJC_ASSOCIATION_COPY)
            isUserInteractionEnabled = true
            let textHelper = ZkTextHelper()
            zkTextHelper = textHelper

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(zkTapAction(recognizer:)))
            addGestureRecognizer(tapGestureRecognizer)
        }
    }

    public func setZkTapBlock(block: @escaping ((Int, NSAttributedString) -> Void)) {
        zkTapBlock = block
    }

    @objc func zkTapAction(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: recognizer.view)
        guard let label = recognizer.view as? UILabel else { return }
        zkTextHelper?.select(location: location, of: label, selectedBlock: { [weak self] (index, attributedString) in
            self?.zkTapBlock?(index, attributedString ?? NSAttributedString())
        })
    }
}




