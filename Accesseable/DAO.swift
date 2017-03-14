//
//  DAO.swift
//  Accesseable
//
//  Created by mobapp02 on 13/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import Foundation
import CoreData

//singleton pattern swift3
public class DAO{
    
    static let sharedDAO:DAO = DAO()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ASea")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
        
    }()
    
    
    private init(){
        let parser = JSONParser()
        //*
            parser.parseTramhaltes(context: persistentContainer.viewContext)
            parser.parseRestaurants(context: persistentContainer.viewContext)
            parser.parseHotels(context: persistentContainer.viewContext)
            parser.parseDijken(context: persistentContainer.viewContext)
            parser.parsePOIs(context: persistentContainer.viewContext)
            parser.parseToiletten(context: persistentContainer.viewContext)
            parser.parseInfo(context: persistentContainer.viewContext)
            parser.parseParking(context: persistentContainer.viewContext)
        //*/
    }
    
    // MARK: - Core Data Fetch Request (restaurants)
    
    func getAllRestaurants() -> [Reca]?
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Reca")
        
        do {
            let restaurant = try persistentContainer.viewContext.fetch(request) as! [Reca]
            return restaurant
        } catch {
            print("Opvragen restaurants niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Fetch Request (hotels)
    
    func getAllHotels() -> [Logies]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Logies")
        
        do {
            let hotel = try persistentContainer.viewContext.fetch(request) as! [Logies]
            return hotel
        } catch {
            print("Opvragen hotels niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Fetch Request (infokantoren)
    
    func getAllInfo() -> [Info]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Info")
        
        do {
            let infokantoor = try persistentContainer.viewContext.fetch(request) as! [Info]
            return infokantoor
        } catch {
            print("Opvragen infokantoren niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Fetch Request (parkings)
    
    func getAllParkings() -> [VPP]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "VPP")
        
        do {
            let parking = try persistentContainer.viewContext.fetch(request) as! [VPP]
            return parking
        } catch {
            print("Opvragen parkings niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Fetch Request (sanitair)
    
    func getAllSanitair() -> [Sanitair]
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Sanitair")
        
        do {
            let sanitair = try persistentContainer.viewContext.fetch(request) as! [Sanitair]
            return sanitair
        } catch {
            print("Opvragen sanitair niet mogelijk!")
        }
        
        return []
    }
    
    
    // MARK: - Core Data Fetch Request (tramhaltes)
    
    func getAllTrams() -> [Tram]?
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Tram")
        
        do {
            let tram = try persistentContainer.viewContext.fetch(request) as! [Tram]
            return tram
        } catch {
            print("Opvragen tramhalte niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Fetch Request (interessante locaties)
    
    func getAllPOIs() -> [POI]?
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "POI")
        
        do {
            let poi = try persistentContainer.viewContext.fetch(request) as! [POI]
            return poi
        } catch {
            print("Opvragen interessante locaties niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Fetch Request (tramhaltes)
    
    func getAllDijken() -> [Dijk]?
    {
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Dijk")
        
        do {
            let dijk = try persistentContainer.viewContext.fetch(request) as! [Dijk]
            return dijk
        } catch {
            print("Opvragen dijk niet mogelijk!")
        }
        
        return []
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

