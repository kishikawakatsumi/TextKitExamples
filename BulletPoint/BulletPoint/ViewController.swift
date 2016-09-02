//
//  ViewController.swift
//  BulletPoint
//
//  Created by Kishikawa Katsumi on 9/2/16.
//  Copyright © 2016 Kishikawa Katsumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let textView = UITextView(frame: CGRectInset(view.bounds, 10, 10))

        textView.editable = false

        textView.textContainerInset = UIEdgeInsetsZero
        textView.textContainer.lineFragmentPadding = 0
        textView.layoutManager.usesFontLeading = false

        view.addSubview(textView)

        let headFont = UIFont.boldSystemFontOfSize(20)
        let subheadFont = UIFont.boldSystemFontOfSize(16)
        let bodyFont = UIFont.systemFontOfSize(12)

        let text = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("List", ofType: "txt")!)
        let attributedText = NSMutableAttributedString(string: text)

        let image = UIImage(named: "bullet")
        let attachment = NSTextAttachment(data: nil, ofType: nil)
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: -2, width: bodyFont.pointSize, height: bodyFont.pointSize)

        let bulletText = NSAttributedString(attachment: attachment)
        attributedText.replaceCharactersInRange(NSRange(location: 350, length: 1), withAttributedString: bulletText)
        attributedText.replaceCharactersInRange(NSRange(location: 502, length: 1), withAttributedString: bulletText)
        attributedText.replaceCharactersInRange(NSRange(location: 617, length: 1), withAttributedString: bulletText)
        attributedText.replaceCharactersInRange(NSRange(location: 650, length: 1), withAttributedString: bulletText)

        do {
            let paragraphStyle = NSMutableParagraphStyle()

            paragraphStyle.minimumLineHeight = ceil(headFont.lineHeight)
            paragraphStyle.maximumLineHeight = ceil(headFont.lineHeight)
            paragraphStyle.paragraphSpacing = ceil(headFont.pointSize / 2)

            let attributes = [
                NSFontAttributeName: headFont,
                NSForegroundColorAttributeName: UIColor(red: 0.22, green: 0.28, blue: 0.50, alpha: 1.0),
                NSParagraphStyleAttributeName: paragraphStyle,
                ]
            attributedText.addAttributes(attributes, range: NSRange(location: 0, length: 33))
        }

        do {
            let paragraphStyle = NSMutableParagraphStyle()

            paragraphStyle.minimumLineHeight = ceil(subheadFont.lineHeight)
            paragraphStyle.maximumLineHeight = ceil(subheadFont.lineHeight)
            paragraphStyle.paragraphSpacing = ceil(subheadFont.lineHeight / 2)

            let attributes = [
                NSFontAttributeName: subheadFont,
                NSForegroundColorAttributeName: UIColor(red: 0.22, green: 0.28, blue: 0.50, alpha: 1.0),
                NSParagraphStyleAttributeName: paragraphStyle,
                ]
            attributedText.addAttributes(attributes, range: NSRange(location: 34, length: 20))
        }

        do {
            let paragraphStyle = NSMutableParagraphStyle()

            paragraphStyle.minimumLineHeight = ceil(bodyFont.lineHeight)
            paragraphStyle.maximumLineHeight = ceil(bodyFont.lineHeight)
            paragraphStyle.lineSpacing = 2
            paragraphStyle.paragraphSpacing = ceil(bodyFont.lineHeight / 2)

            paragraphStyle.alignment = .Justified

            let attributes = [
                NSFontAttributeName: bodyFont,
                NSForegroundColorAttributeName: UIColor(red: 0.22, green: 0.28, blue: 0.50, alpha: 1.0),
                NSParagraphStyleAttributeName: paragraphStyle,
                ]
            attributedText.addAttributes(attributes, range: NSRange(location: 55, length: 275))
        }

        do {
            let paragraphStyle = NSMutableParagraphStyle()

            paragraphStyle.minimumLineHeight = ceil(subheadFont.lineHeight)
            paragraphStyle.maximumLineHeight = ceil(subheadFont.lineHeight)
            paragraphStyle.paragraphSpacing = ceil(subheadFont.lineHeight / 2)

            let attributes = [
                NSFontAttributeName: subheadFont,
                NSForegroundColorAttributeName: UIColor(red: 0.22, green: 0.28, blue: 0.50, alpha: 1.0),
                NSParagraphStyleAttributeName: paragraphStyle,
                ]
            attributedText.addAttributes(attributes, range: NSRange(location: 330, length: 19))
        }

        do {
            let paragraphStyle = NSMutableParagraphStyle()

            paragraphStyle.minimumLineHeight = ceil(bodyFont.lineHeight)
            paragraphStyle.maximumLineHeight = ceil(bodyFont.lineHeight)
            paragraphStyle.lineSpacing = 2
            paragraphStyle.paragraphSpacing = ceil(bodyFont.lineHeight / 2)

            paragraphStyle.headIndent = bodyFont.pointSize * 2
            paragraphStyle.alignment = .Justified

            paragraphStyle.tabStops = []
            paragraphStyle.defaultTabInterval = bodyFont.pointSize * 2

            let attributes = [
                NSFontAttributeName: bodyFont,
                NSForegroundColorAttributeName: UIColor(red: 0.22, green: 0.28, blue: 0.50, alpha: 1.0),
                NSParagraphStyleAttributeName: paragraphStyle,
                ]
            attributedText.addAttributes(attributes, range: NSRange(location: 350, length: 472))
        }

        do {
            let paragraphStyle = NSMutableParagraphStyle()

            paragraphStyle.minimumLineHeight = ceil(bodyFont.lineHeight)
            paragraphStyle.maximumLineHeight = ceil(bodyFont.lineHeight)
            paragraphStyle.lineSpacing = 2
            paragraphStyle.paragraphSpacing = ceil(bodyFont.lineHeight / 2)

            paragraphStyle.alignment = .Justified

            let attributes = [
                NSFontAttributeName: bodyFont,
                NSForegroundColorAttributeName: UIColor(red: 0.22, green: 0.28, blue: 0.50, alpha: 1.0),
                NSParagraphStyleAttributeName: paragraphStyle,
                ]
            attributedText.addAttributes(attributes, range: NSRange(location: 822, length: 126))
        }

        textView.attributedText = attributedText
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
