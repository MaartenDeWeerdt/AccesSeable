//
//  MapViewController.swift
//  Accesseable
//
//  Created by mobapp02 on 14/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    
    @IBOutlet weak var tfLon: UITextField!
    @IBOutlet weak var tfLat: UITextField!
    @IBOutlet weak var mapview: MKMapView!
    
    var items:[NSManagedObject]?

    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //Annotations laten verschijnen
        createRestaurantsAnnotation()
        createTramsAnnotation()
        createInfoAnnotation()
        createParkingAnnotation()
        createToilettenAnnotation()
        createParkingAnnotation()
        createToilettenAnnotation()
        createPOIsAnnotation()
        createDijkenAnnotation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedWhenInUse: mapview.showsUserLocation = true
        locationManager.startUpdatingLocation()
        case .authorizedAlways: mapview.showsUserLocation = true
        locationManager.startUpdatingLocation()
        case .denied: mapview.showsUserLocation = false
        print("computer says no")
        default: break
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1000, 1000)
        mapview.region = region
    }
    
    
    func createRestaurantsAnnotation()
    {
        for Reca in DAO.sharedDAO.getAllRestaurants()!
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(Reca.lat!)
            let lonStr = Double(Reca.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
        
        }
        
    }
    
    func createTramsAnnotation()
    {
        for Tram in DAO.sharedDAO.getAllTrams()!
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(Tram.lat!)
           let lonStr = Double(Tram.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createInfoAnnotation()
    {
        for Info in DAO.sharedDAO.getAllInfo()
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(Info.lat!)
            let lonStr = Double(Info.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createParkingAnnotation()
    {
        for Parking in DAO.sharedDAO.getAllParkings()
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(Parking.lat!)
            let lonStr = Double(Parking.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createToilettenAnnotation()
    {
        for Toilet in DAO.sharedDAO.getAllSanitair()
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(Toilet.lat!)
            let lonStr = Double(Toilet.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createPOIsAnnotation()
    {
        for POIs in DAO.sharedDAO.getAllPOIs()!
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(POIs.lat!)
            let lonStr = Double(POIs.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createDijkenAnnotation()
    {
        for Dijk in DAO.sharedDAO.getAllDijken()!
        {
            let annotation = MKPointAnnotation.init()
            
            let latStr = Double(Dijk.lat!)
            let lonStr = Double(Dijk.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    

}
