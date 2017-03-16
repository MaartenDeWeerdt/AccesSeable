//
//  TabbarCollectionViewCell.swift
//  Accesseable
//
//  Created by mobapp09 on 16/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit

class TabbarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCategorie: UILabel!

    override var isSelected: Bool{
        didSet{
            if isSelected{
                self.backgroundColor = UIColor.yellow
            }
        }
    }
    
}
