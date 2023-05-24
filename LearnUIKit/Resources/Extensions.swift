//
//  Extensions.swift
//  LearnUIKit
//
//  Created by Duc Do on 24/05/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({
            addSubview($0)
        })
    }
}
