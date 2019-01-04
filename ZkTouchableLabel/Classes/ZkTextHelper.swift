//
//  ZkTextHelper.swift
//  ZkTouchableLabel
//
//  Created by ziank on 2019/1/4.
//

import UIKit

class ZkTextHelper {
    var textStorage: NSTextStorage = NSTextStorage()
    var layoutManager: NSLayoutManager = NSLayoutManager()
    var textContainer: NSTextContainer = NSTextContainer()

    init() {
        textStorage.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
    }

    func select(location: CGPoint, of label: UILabel, selectedBlock: ((Int, NSAttributedString?) -> Void)) {
        textContainer.size = label.bounds.size
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = label.numberOfLines
        textContainer.lineBreakMode = label.lineBreakMode

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = label.textAlignment

        let attributedText = NSMutableAttributedString(attributedString: label.attributedText ?? NSAttributedString())
        attributedText.enumerateAttributes(in: NSMakeRange(0, attributedText.length), options: NSAttributedString.EnumerationOptions(rawValue: 0)) { (attributes, range, _) in
            if attributes[.font] == nil {
                attributedText.addAttribute(.font, value: label.font, range: range)
            }
            if attributes[.paragraphStyle] == nil {
                attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
            }
        }

        textStorage.setAttributedString(attributedText)

        var location = location
        let textSize = layoutManager.usedRect(for: textContainer).size
        location.y -= (label.frame.height - textSize.height) / 2

        let glyphIndex = layoutManager.glyphIndex(for: location, in: textContainer)
        let fontPointSize = label.font.pointSize
        layoutManager.setAttachmentSize(CGSize(width: fontPointSize, height: fontPointSize), forGlyphRange: NSMakeRange((label.text?.count ?? 0) - 1, 1))
        let attributedString = label.attributedText?.attributedSubstring(from: NSMakeRange(glyphIndex, 1))
        let glyphRect = layoutManager.boundingRect(forGlyphRange: NSMakeRange(glyphIndex, 1), in: textContainer)

        if !glyphRect.contains(location) {
            selectedBlock(-1, nil)
            return
        }

        selectedBlock(glyphIndex, attributedString)
    }
}
