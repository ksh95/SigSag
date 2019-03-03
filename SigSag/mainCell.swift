//
//  mainCell.swift
//  SigSag
//
//  Created by 김시환 on 2019. 3. 3..
//  Copyright © 2019년 김시환. All rights reserved.
//

import UIKit

class mainCell: UICollectionViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainPriceLabel: UILabel!
    
    override func awakeFromNib() {        
        mainImageView.layer.cornerRadius = 5
        mainImageView.clipsToBounds = true
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected
            {
            }
        }
    }
    
}
