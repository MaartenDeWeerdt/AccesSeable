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
    
        let restaurants = Category.init(naam: "Restaurant", afbeeldingsNaam: "restaurant.png")
        let hotels = Category.init(naam: "Hotels", afbeeldingsNaam: "home.png")
        let infokantoren = Category.init(naam: "Infokantoren", afbeeldingsNaam: "info.png")
        let parkings = Category.init(naam: "Parkings", afbeeldingsNaam: "parking.png")
        let toiletten = Category.init(naam: "Toiletten", afbeeldingsNaam: "Sanitair.png")
        let tramhaltes = Category.init(naam: "Tramhaltes", afbeeldingsNaam: "tram.png")
        let POIs = Category.init(naam: "Interessante locaties", afbeeldingsNaam: "POI.png")
        let dijken = Category.init(naam: "Dijken", afbeeldingsNaam: "ZZZ.png")
        
        self.categoryList += [restaurants, hotels, infokantoren, parkings, toiletten, tramhaltes, POIs, dijken]
    }
    
}
