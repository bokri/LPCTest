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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        typeImageView.applyGradient()
    }
    
    func configureCellFor(pot: Pot){
        
        self.titleLabel.text = pot.name
        
        do {
            let url = try pot.imageUrl.asURL()
            
            self.typeImageView.kf.setImage(with: url, placeholder: Asset.logo.image, options: nil, progressBlock: nil, completionHandler: nil)
                        
            } catch {
                print(error.localizedDescription)
                self.typeImageView.image = Asset.logo.image
            }
    }
}
