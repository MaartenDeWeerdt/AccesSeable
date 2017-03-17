//
//  AccesseableDAO.swift
//  Accesseable
//
//  Created by mobapp04 on 13/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import Foundation
import CoreData


public class JSONParser{
    
    func parseTramhaltes( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string: "http://web10.weopendata.com/measurements/tram")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                let volgendeTram = Tram(context: context)
                
                
                //strings omzetten waar nodig
                
                volgendeTram.naam = jsonObject.value(forKey: "stop_name") as? String
                volgendeTram.lat = jsonObject.value(forKey: "stop_lat") as! String?
                volgendeTram.lon = jsonObject.value(forKey: "stop_lon") as! String?
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de tram data")
            
        }}
    
    func parseRestaurants( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string:"http://web10.weopendata.com/measurements/reca")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                
                let restaurant = Reca (context: context)
                
                
                //strings omzetten waar nodig
                
                restaurant.naam = jsonObject.value(forKey: "NAAM") as? String
                restaurant.deelgemeente = jsonObject.value(forKey: "DEELGEMEENTE") as? String
                restaurant.adres_straat =  jsonObject.value(forKey: "ADRES_STRAAT") as? String
                restaurant.lat = jsonObject.value(forKey: "LAT") as? String
                restaurant.lon = jsonObject.value(forKey: "LON") as? String
                restaurant.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                restaurant.postcode = jsonObject.value(forKey: "PNR") as? String
                restaurant.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de restaurants data")
        }
    }
    
    func parseHotels( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string: "http://web10.weopendata.com/measurements/logies")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                
                let hotel = Logies(context: context)
                
                
                //strings omzetten waar nodig
                
                hotel.naam = jsonObject.value(forKey: "NAAM") as? String
                hotel.deelgemeente = jsonObject.value(forKey: "DEELGEMEENTE") as? String
                hotel.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as? String
                hotel.lat = jsonObject.value(forKey: "LAT") as? String
                hotel.lon = jsonObject.value(forKey: "LON") as? String
                hotel.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                hotel.postcode = jsonObject.value(forKey: "POSTCODE") as? String
                hotel.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de hotels data")
        }
    }
    func parseInfo( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string: "http://web10.weopendata.com/measurements/info")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                
                
                
                let infoKantoren = Info(context: context)
                
                //strings omzetten waar nodig
                
                infoKantoren.naam = jsonObject.value(forKey: "NAAM") as? String
                infoKantoren.deelgemeente = jsonObject.value(forKey: "DEELGEMEENTE") as? String
                infoKantoren.adres_straat =  jsonObject.value(forKey: "ADRES_STRAAT") as? String
                infoKantoren.lat = jsonObject.value(forKey: "LAT") as? String
                infoKantoren.lon = jsonObject.value(forKey: "LON") as? String
                infoKantoren.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                infoKantoren.postcode = jsonObject.value(forKey: "PNR") as? String
                infoKantoren.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de info data")
        }
    }
    
    func parseToiletten( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string: "http://web10.weopendata.com/measurements/sanitair")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                
                
                
                let toilet = Sanitair(context: context)
                
                
                
                //strings omzetten waar nodig
                
                toilet.naam = jsonObject.value(forKey: "NAAM") as? String
                toilet.deelgemeente =  jsonObject.value(forKey: "DEELGEMEENTE") as? String
                toilet.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as? String
                toilet.lat = jsonObject.value(forKey: "LAT") as? String
                toilet.lon = jsonObject.value(forKey: "LON") as? String
                toilet.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                toilet.postcode = jsonObject.value(forKey: "PNR") as? String
                toilet.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de wc data")
        }
    }
    func parsePOIs( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string: "http://web10.weopendata.com/measurements/poi")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                
                
                let interessanteLocatie = POI(context: context)
                
                
                //strings omzetten waar nodig
                
                interessanteLocatie.naam = jsonObject.value(forKey: "NAAM") as? String
                interessanteLocatie.deelgemeente = jsonObject.value(forKey: "DEELGEMEENTE") as? String
                interessanteLocatie.adres_straat = jsonObject.value(forKey: "ADRES_STRAAT") as? String
                interessanteLocatie.lat = jsonObject.value(forKey: "LAT") as? String
                interessanteLocatie.lon = jsonObject.value(forKey: "LON") as? String
                interessanteLocatie.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                interessanteLocatie.postcode = jsonObject.value(forKey: "PNR") as? String
                interessanteLocatie.adres_nr = jsonObject.value(forKey: "ADRES_NR") as? String
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de poi data")
        }
    }
    func parseDijken( context:NSManagedObjectContext)
    {
        //waar staan de gegevens
        let url = URL(string: "http://web10.weopendata.com/measurements/dijk")
        //exceptions mogelijk bv. geen internet
        do {
            //data binnentrekken van url en in array opslaan
            let jsonData = try Data(contentsOf: url!)
            let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
            
            //elk item in array overlopen om gegevens uit te halen
            for item in jsonArray {
                
                let jsonObject:NSDictionary = item as! NSDictionary
                //entiteit aanmaken, context = verwijzing naar waar opgeslaan
                
                
                
                let dijken = Dijk(context: context)
                
                
                //strings omzetten waar nodig
                
                dijken.naam = jsonObject.value(forKey: "NAAM") as? String
                dijken.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                dijken.adres_locatie = jsonObject.value(forKey: "ADRES_LOCATIE") as? String
                dijken.lat = jsonObject.value(forKey: "LAT") as? String
                dijken.lon = jsonObject.value(forKey: "LON") as? String
                dijken.url_picture_main = jsonObject.value(forKey: "URL_PICTURE_MAIN") as? String
                dijken.postcode = jsonObject.value(forKey: "POSTCODE") as? String
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de dijken data")
        }
    }
}
