//
//  String+Extension.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 18/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//

import UIKit


// MARK: - Text height calculation

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
