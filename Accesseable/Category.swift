//
//  Category.swift
//  Accesseable
//
//  Created by mobapp02 on 16/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import Foundation
import UIKit

public class Category{
    var naam:String
    var afbeelding:UIImage
    
    init(naam:String, afbeeldingsNaam:String){
        self.naam = naam
        self.afbeelding = UIImage.init(named: afbeeldingsNaam)!
    }
}
