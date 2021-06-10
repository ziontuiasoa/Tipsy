//
//  Ext+UIButton.swift
//  Tipsy
//
//  Created by Zion Tuiasoa on 12/22/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
                UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
                if let context = UIGraphicsGetCurrentContext() {
                    context.setFillColor(color.cgColor)
                    context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
                    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    self.setBackgroundImage(colorImage, for: state)
                }
    }
}
