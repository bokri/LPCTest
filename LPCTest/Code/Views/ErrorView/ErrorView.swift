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
    
    // MARK : - Properties

    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var errorImageView: UIImageView!
    
    // MARK : - Constructor
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadNibContent()
        
    }
    
    // MARK : - Overrides
    
    override func awakeFromNib() {
        errorTextLabel.text = L10n.noNet.string
        errorImageView.image = Asset.emoticonSad.image
    }


}
