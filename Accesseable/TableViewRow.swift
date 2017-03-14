//
//  TableViewRow.swift
//  Accesseable
//
//  Created by mobapp09 on 14/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import Foundation

public class TableViewRow {
    
    var title:String
    var items:[String]
    
    init(title:String, items:[String]) {
        self.title = title
        self.items = items
    }
}
