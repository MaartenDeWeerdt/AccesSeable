//
//  CategoryDAO.swift
//  Accesseable
//
//  Created by mobapp02 on 16/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import Foundation

public class CategoryDAO {

    var categoryList:[Category] = []

    init() {
    
        let restaurants = Category.init(naam: "Restaurant", afbeeldingsNaam: "restaurantS.png")
        let hotels = Category.init(naam: "Hotels", afbeeldingsNaam: "homeS.png")
        let infokantoren = Category.init(naam: "Infokantoren", afbeeldingsNaam: "info.png")
        //let parkings = Category.init(naam: "Parkings", afbeeldingsNaam: "parkingS.png")
        let toiletten = Category.init(naam: "Toiletten", afbeeldingsNaam: "SanitairS.png")
        let tramhaltes = Category.init(naam: "Tramhaltes", afbeeldingsNaam: "tramS.png")
        let POIs = Category.init(naam: "Interessante locaties", afbeeldingsNaam: "POIS.png")
        let dijken = Category.init(naam: "Dijken", afbeeldingsNaam: "ZZZS.png")
        
        self.categoryList += [restaurants, hotels, infokantoren, toiletten, tramhaltes, POIs, dijken]
    }
    
}
