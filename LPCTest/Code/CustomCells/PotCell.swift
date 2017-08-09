//
//  PotCell.swift
//  LPCTest
//
//  Created by Aymen Bokri on 09/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class PotCell : UITableViewCell, NibReusable {
    
    // MARK: - Properties
    
    @IBOutlet internal weak var titleLabel: UILabel!
    @IBOutlet internal weak var typeImageView: UIImageView!
    
    
    
    func configureCellFor(pot: Pot){
        
        self.titleLabel.text = pot.name
        
        if let path = pot.imageUrl {
            
            let url = URL(string: path)
            
            self.typeImageView.kf.setImage(with: url, placeholder: Asset.logo.image, options: nil, progressBlock: nil, completionHandler: nil)
        
        }
        
    }
}
