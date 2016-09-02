//
//  UIFont+transform.swift
//  Math
//
//  Created by Kishikawa Katsumi on 9/1/16.
//  Copyright © 2016 Kishikawa Katsumi. All rights reserved.
//

import UIKit

extension UIFont {

    func scale(x x: CGFloat, y: CGFloat) -> UIFont {
        return transform(CGAffineTransformMakeScale(x, y))
    }

    func transform(matrix: CGAffineTransform) -> UIFont {
        return UIFont(descriptor: fontDescriptor().fontDescriptorWithMatrix(matrix), size: pointSize)
    }

}
