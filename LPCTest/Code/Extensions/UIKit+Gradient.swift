//
//  UIImageView+Gradient.swift
//  LPCTest
//
//  Created by Aymen Bokri on 10/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import UIKit

extension UIView {
    
    // UIView extension to apply gradient
    func applyGradient() {
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(0.2).cgColor, UIColor.black.withAlphaComponent(0.9).cgColor]
        self.layer.addSublayer(gradient)
 
    }

}
