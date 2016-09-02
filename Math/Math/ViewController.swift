//
//  ViewController.swift
//  Math
//
//  Created by Kishikawa Katsumi on 9/1/16.
//  Copyright © 2016 Kishikawa Katsumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    let font = UIFont(name: "LatinModernMath-Regular", size: 20)!

    override func viewDidLoad() {
        super.viewDidLoad()

        label.frame = CGRectInset(view.bounds, 10, 10)
        label.numberOfLines = 0
        view.addSubview(label)

        let attributedText = NSMutableAttributedString()

        attributedText.appendAttributedString(NSAttributedString(string: "The Quadratic Formula\n\n", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]))
        attributedText.appendAttributedString(formula1())

        attributedText.appendAttributedString(NSAttributedString(string: "\n"))

        attributedText.appendAttributedString(NSAttributedString(string: "Standard Deviation and Variance\n\n", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]))
        attributedText.appendAttributedString(formula2())

        label.attributedText = attributedText
        label.sizeToFit()
    }

    func formula1() -> NSAttributedString {
        let formula = expression("x = -b \\pm \\sqrtb2-4ac2a")
            .stringByAppendingString("".stringByPaddingToLength(5, withString: Symbols.horizontalLine, startingAtIndex: 0)) // line of sqrt
            .stringByAppendingString("".stringByPaddingToLength(10, withString: Symbols.horizontalLine, startingAtIndex: 0)) // line of fraction

        let range = NSRange(location: 0, length: formula.utf16.count)

        let attributedText = NSMutableAttributedString(string: formula)
        attributedText.setAttributes([NSFontAttributeName: UIFont(name: "LatinModernMath-Regular", size: 20)!], range: range)

        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -12, range: NSRange(location: 0, length: 5)) // x = -b

        attributedText.addAttribute(NSFontAttributeName, value: font.scale(x: 0.6, y: 0.6), range: NSRange(location: 14, length: 1)) // superscript
        attributedText.addAttribute(String(kCTSuperscriptAttributeName), value: 1, range: NSRange(location: 14, length: 1)) // superscript
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: 2, range: NSRange(location: 14, length: 1)) // superscript

        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -26, range: NSRange(location: 21, length: 3)) // 2a
        attributedText.addAttribute(NSKernAttributeName, value: -68, range: NSRange(location: 19, length: 2)) // 2a

        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: 18, range: NSRange(location: 11, length: 1)) // sqrt

        attributedText.addAttribute(NSKernAttributeName, value: -12, range: NSRange(location: 22, length: 2)) // line of sqrt
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: 14, range: NSRange(location: 24, length: 5)) // line of sqrt

        attributedText.addAttribute(NSKernAttributeName, value: -135, range: NSRange(location: 28, length: 1)) // line of fraction
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -12, range: NSRange(location: 29, length: 10)) // line of fraction

        let paragraghStyle = NSMutableParagraphStyle()
        paragraghStyle.alignment = .Center
        paragraghStyle.paragraphSpacing = 40
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraghStyle, range: NSRange(location: 0, length: attributedText.string.utf16.count))

        return attributedText
    }

    func formula2() -> NSAttributedString {
        let formula = expression("\\sigma = \\sqrt1N\(Symbols.horizontalLine)\\sum_i=1N (xi - \\mu)2")
            .stringByAppendingString("".stringByPaddingToLength(9, withString: Symbols.horizontalLine, startingAtIndex: 0))

        let range = NSRange(location: 0, length: formula.utf16.count)

        let attributedText = NSMutableAttributedString(string: formula)
        attributedText.setAttributes([NSFontAttributeName: font], range: range)

        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -8, range: NSRange(location: 0, length: 5)) // z =

        attributedText.addAttribute(NSFontAttributeName, value: font.scale(x: 1, y: 2.4), range: NSRange(location: 5, length: 1)) // sqrt
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: 20, range: NSRange(location: 5, length: 1)) // sqrt
        attributedText.addAttribute(NSKernAttributeName, value: 2, range: NSRange(location: 5, length: 1)) // sqrt

        attributedText.addAttribute(NSKernAttributeName, value: -14, range: NSRange(location: 6, length: 1)) // fraction of N
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -20, range: NSRange(location: 7, length: 2)) // fraction of N
        attributedText.addAttribute(NSKernAttributeName, value: -14, range: NSRange(location: 7, length: 2)) // line of fraction
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -8, range: NSRange(location: 9, length: 1)) // line of fraction

        attributedText.addAttribute(NSKernAttributeName, value: 4, range: NSRange(location: 9, length: 1)) // Sum
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -8, range: NSRange(location: 10, length: 1)) // Sum

        attributedText.addAttribute(NSKernAttributeName, value: -20, range: NSRange(location: 10, length: 1)) // i=i
        attributedText.addAttribute(NSFontAttributeName, value: font.scale(x: 0.6, y: 0.6), range: NSRange(location: 11, length: 4)) // i=i
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -24, range: NSRange(location: 11, length: 4)) // i=i

        attributedText.addAttribute(NSKernAttributeName, value: -14, range: NSRange(location: 14, length: 1)) // N
        attributedText.addAttribute(NSFontAttributeName, value: font.scale(x: 0.6, y: 0.6), range: NSRange(location: 15, length: 2)) // N
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: 10, range: NSRange(location: 15, length: 2)) // N

        attributedText.addAttribute(NSFontAttributeName, value: font.scale(x: 0.6, y: 0.6), range: NSRange(location: 21, length: 2)) // subscript i
        attributedText.addAttribute(String(kCTSuperscriptAttributeName), value: -1, range: NSRange(location: 21, length: 2)) // subscript i

        attributedText.addAttribute(NSFontAttributeName, value: font.scale(x: 0.6, y: 0.6), range: NSRange(location: 29, length: 1)) // superscript 2
        attributedText.addAttribute(String(kCTSuperscriptAttributeName), value: 1, range: NSRange(location: 29, length: 1)) // superscript 2

        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: -8, range: NSRange(location: 18, length: 12)) // (xi - u)2

        attributedText.addAttribute(NSKernAttributeName, value: -118, range: NSRange(location: 29, length: 1)) // line of sqrt
        attributedText.addAttribute(NSBaselineOffsetAttributeName, value: 16, range: NSRange(location: 30, length: 9)) // line of sqrt

        let paragraghStyle = NSMutableParagraphStyle()
        paragraghStyle.alignment = .Center
        paragraghStyle.paragraphSpacing = 40
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraghStyle, range: NSRange(location: 0, length: attributedText.string.utf16.count))

        return attributedText
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
