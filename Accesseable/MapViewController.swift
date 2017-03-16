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

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var mapview: MKMapView!
    
    // variables
    var items:[NSManagedObject]?

    var locationManager = CLLocationManager()
    var pointAnnotation:CustomPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    var checked = [Bool]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapview.delegate = self
        mapview.mapType = MKMapType.standard
        
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
    
    // MARK: asking authorization from user
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
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500)
        mapview.region = region
    }
    
    // Pokemon
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    // Pokemon
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! CustomPointAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinImageName)

        return annotationView
        
        
    }
    
    func createRestaurantsAnnotation()
    {
        for Reca in DAO.sharedDAO.getAllRestaurants()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Reca.lat!)
            let lonStr = Double(Reca.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Reca.naam
            annotation.pinImageName = "RestaurantS"
            
            
            mapview.addAnnotation(annotation)
        
        }
        
    }
    
    func createTramsAnnotation()
    {
        for Tram in DAO.sharedDAO.getAllTrams()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Tram.lat!)
            let lonStr = Double(Tram.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Tram.naam
            annotation.pinImageName = "tramS"
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createInfoAnnotation()
    {
        for Info in DAO.sharedDAO.getAllInfo()
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Info.lat!)
            let lonStr = Double(Info.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Info.naam
            annotation.pinImageName = "InfoS"
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createParkingAnnotation()
    {
        for Parking in DAO.sharedDAO.getAllParkings()
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Parking.lat!)
            let lonStr = Double(Parking.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Parking.naam
            annotation.pinImageName = "parkingS"
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createToilettenAnnotation()
    {
        for Toilet in DAO.sharedDAO.getAllSanitair()
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Toilet.lat!)
            let lonStr = Double(Toilet.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Toilet.naam
            annotation.pinImageName = "SanitairS"
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createPOIsAnnotation()
    {
        for POIs in DAO.sharedDAO.getAllPOIs()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(POIs.lat!)
            let lonStr = Double(POIs.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = POIs.naam
            annotation.pinImageName = "POIS"
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    func createDijkenAnnotation()
    {
        for Dijk in DAO.sharedDAO.getAllDijken()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Dijk.lat!)
            let lonStr = Double(Dijk.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Dijk.naam
            annotation.pinImageName = "ZZZS"
            
            mapview.addAnnotation(annotation)
            
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "mapCell")!
        
        
        
        return cell
    }
    

    
    
    
    
}

    
    
    

