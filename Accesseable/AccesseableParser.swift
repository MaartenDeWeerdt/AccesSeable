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
                volgendeTram.naam = jsonObject.value(forKey: "naam") as? String
                //rest keys nog niet geparset
            }
        } catch  {
            print("Fout bij binnenhalen van de data")
        
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
                   
                    restaurant.adres_straat =  jsonObject.value(forKey: "ADRES_STRAAT") as! String?
                    restaurant.gemeente = jsonObject.value(forKey: "GEMEENTE") as? String
                    restaurant.naam = jsonObject.value(forKey: "NAAM") as? String
                    //rest keys nog niet geparset
                }
            } catch  {
                print("Fout bij binnenhalen van de data")
            }
}

func parseHotels( context:NSManagedObjectContext)
{
    //waar staan de gegevens
    let url = URL(string: "//web10.weopendata.com/measurements/logies")
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
           
            hotel.tel =  jsonObject.value(forKey: "tel") as? String
            hotel.naam = jsonObject.value(forKey: "naam") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de data")
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
          
            infoKantoren.adres_straat =  jsonObject.value(forKey: "adres_straat") as? String
            infoKantoren.gsm = jsonObject.value(forKey: "gsm") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de data")
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
          
            parking.id_westkans = jsonObject.value(forKey: "id_westkans") as? String
            parking.gemeente = jsonObject.value(forKey: "gemeente") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de data")
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
            
            toilet.regio =  jsonObject.value(forKey: "regio") as? String
            toilet.naam = jsonObject.value(forKey: "naam") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de data")
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
          
            interessanteLocatie.openingsuren = jsonObject.value(forKey: "openingsuren") as? String
            interessanteLocatie.mail = jsonObject.value(forKey: "mail") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de data")
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
           
            dijken.adres_locatie =  jsonObject.value(forKey: "adres_locatie") as? String
            dijken.type = jsonObject.value(forKey: "type") as? String
            //rest keys nog niet geparset
        }
    } catch  {
        print("Fout bij binnenhalen van de data")
    }
    }
 }
