//
//  SegmentedControlExtension.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 18/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//

import UIKit


// MARK: - Segemented control extension

extension UISegmentedControl{
    func defaultConfiguration(font: UIFont = UIFont.systemFont(ofSize: 12), color: UIColor = UIColor.white){
        
        let defaultAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(defaultAttributes, for: .normal)
    }

    func selectedConfiguration(font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = UIColor.red) {
        
        let selectedAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    

    
}
