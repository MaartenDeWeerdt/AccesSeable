//
//  MapFilterTableViewCell.swift
//  Accesseable
//
//  Created by mobapp02 on 17/03/2017.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit

class MapFilterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ivFilterImage: UIImageView!
    @IBOutlet weak var lblFilterNaam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
