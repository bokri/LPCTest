//
//  ErrorView.swift
//  LPCTest
//
//  Created by Aymen Bokri on 11/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import UIKit
import Reusable

class ErrorView: UIView, NibOwnerLoadable {

    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var errorImageView: UIImageView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadNibContent()
        
    }
    
    override func awakeFromNib() {
        errorTextLabel.text = L10n.noNet.string
        errorImageView.image = Asset.emoticonSad.image
    }


}
