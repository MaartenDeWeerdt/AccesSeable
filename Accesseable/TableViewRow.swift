//
//  TableViewRow.swift
//  Accesseable
//
//  Created by mobapp09 on 14/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import Foundation
import CoreData

public class TableViewRow {
    
    var title:String
    var items:[NSManagedObject]
    
    init(title:String, items:[NSManagedObject]) {
        self.title = title
        self.items = items
    }
}
