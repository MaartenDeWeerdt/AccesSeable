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
               
                volgendeTram.stop_id = jsonObject.value(forKey: "stop_id") as? String
                volgendeTram.naam = jsonObject.value(forKey: "stop_name") as? String
                volgendeTram.lat = jsonObject.value(forKey: "stop_lat") as? String
                volgendeTram.lon = jsonObject.value(forKey: "stop_lon") as? String
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
                   
                    restaurant.adres_straat =  jsonObject.value(forKey: "ADRES_STRAAT") as? String
                    restaurant.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                    restaurant.naam = jsonObject.value(forKey: "NAAM") as? String
                    restaurant.lat = jsonObject.value(forKey: "LAT") as? String
                    restaurant.lon = jsonObject.value(forKey: "LON") as? String
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
           
            hotel.tel =  jsonObject.value(forKey: "TEL") as? String
            hotel.naam = jsonObject.value(forKey: "NAAM") as? String
            hotel.lat = jsonObject.value(forKey: "LAT") as? String
            hotel.lon = jsonObject.value(forKey: "LON") as? String
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
          
            infoKantoren.adres_straat =  jsonObject.value(forKey: "ADRES_STRAAT") as? String
            infoKantoren.gsm = jsonObject.value(forKey: "GSM") as? String
            infoKantoren.naam = jsonObject.value(forKey: "NAAM") as? String
            infoKantoren.lat = jsonObject.value(forKey: "LAT") as? String
            infoKantoren.lon = jsonObject.value(forKey: "LON") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de info data")
    }
}

func parseParking( context:NSManagedObjectContext)
{
    //waar staan de gegevens
    let url = URL(string: "http://web10.weopendata.com/measurements/vpp")
    //exceptions mogelijk bv. geen internet
    do {
        //data binnentrekken van url en in array opslaan
        let jsonData = try Data(contentsOf: url!)
        let jsonArray:NSArray = try JSONSerialization.jsonObject(with: jsonData) as! NSArray
        
        //elk item in array overlopen om gegevens uit te halen
        for item in jsonArray {
            
            let jsonObject:NSDictionary = item as! NSDictionary
            //entiteit aanmaken, context = verwijzing naar waar opgeslaan
            
            
          
            let parking = VPP(context: context)
        
            
            //strings omzetten waar nodig
          
            parking.id_westkans = jsonObject.value(forKey: "ID_WESTKANS") as? String
            parking.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
            parking.naam = jsonObject.value(forKey: "NAAM") as? String
            parking.lat = jsonObject.value(forKey: "LAT") as? String
            parking.lon = jsonObject.value(forKey: "LON") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de parking data")
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
            
            toilet.regio =  jsonObject.value(forKey: "REGIO") as? String
            toilet.naam = jsonObject.value(forKey: "NAAM") as? String
            toilet.lat = jsonObject.value(forKey: "LAT") as? String
            toilet.lon = jsonObject.value(forKey: "LON") as? String
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
          
            interessanteLocatie.openingsuren = jsonObject.value(forKey: "OPENINGSUREN") as? String
            interessanteLocatie.mail = jsonObject.value(forKey: "MAIL") as? String
            interessanteLocatie.naam = jsonObject.value(forKey: "NAAM") as? String
            interessanteLocatie.lat = jsonObject.value(forKey: "LAT") as? String
            interessanteLocatie.lon = jsonObject.value(forKey: "LON") as? String
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
           
            dijken.adres_locatie =  jsonObject.value(forKey: "ADRES_LOCATIE") as? String
            dijken.type = jsonObject.value(forKey: "TYPE") as? String
            dijken.naam = jsonObject.value(forKey: "NAAM") as? String
            dijken.lat = jsonObject.value(forKey: "LAT") as? String
            dijken.lon = jsonObject.value(forKey: "LON") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de dijken data")
    }
    }
 }
