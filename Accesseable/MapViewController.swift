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
    
    var restaurantsAnnotations:[CustomPointAnnotation]?
    var hotelsAnnotations:[CustomPointAnnotation]?
    var infokantorenAnnotations:[CustomPointAnnotation]?
    var toilettenAnnotations:[CustomPointAnnotation]?
    var tramhaltesAnnotations:[CustomPointAnnotation]?
    var poisAnnotations:[CustomPointAnnotation]?
    var dijkAnnotations:[CustomPointAnnotation]?
    
    var locationManager = CLLocationManager()
    var pointAnnotation:CustomPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    
    var category = ["Restaurants", "Hotels", "Infokantoren", "Toiletten", "Tramhaltes", "Interessante locaties", "Dijken"]
    
    var categoryDAO:CategoryDAO = CategoryDAO.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapview.delegate = self
        mapview.mapType = MKMapType.standard
        mapview.showsUserLocation = true
        
        
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        locationManager.stopUpdatingLocation()
        
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let region = MKCoordinateRegion (center: location,span: span)
        
        mapview.setRegion(region, animated: true)
    }
    
    
    // Pokemon
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
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
        restaurantsAnnotations = [CustomPointAnnotation]()
        
        for Reca in DAO.sharedDAO.getAllRestaurants()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Reca.lat!)
            let lonStr = Double(Reca.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Reca.naam
            annotation.pinImageName = "RestaurantS"
            
            
            restaurantsAnnotations?.append(annotation)
            
        }
        
        mapview.addAnnotations(restaurantsAnnotations!)
        
    }
    
    func createHotelsAnnotation()
    {
        hotelsAnnotations = [CustomPointAnnotation]()
        
        for Logies in DAO.sharedDAO.getAllHotels()
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Logies.lat!)
            let lonStr = Double(Logies.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Logies.naam
            annotation.pinImageName = "HomeS"
            
            
            hotelsAnnotations?.append(annotation)
        }
        
        mapview.addAnnotations(hotelsAnnotations!)
        
    }
    
    func createTramsAnnotation()
    {
        tramhaltesAnnotations = [CustomPointAnnotation]()
        
        for Tram in DAO.sharedDAO.getAllTrams()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Tram.lat!)
           let lonStr = Double(Tram.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Tram.naam
            annotation.pinImageName = "tramS"
            
            tramhaltesAnnotations?.append(annotation)
            
        }
        
        mapview.addAnnotations(tramhaltesAnnotations!)
        
    }
    
    func createInfoAnnotation()
    {
        infokantorenAnnotations = [CustomPointAnnotation]()
        
        for Info in DAO.sharedDAO.getAllInfo()
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Info.lat!)
            let lonStr = Double(Info.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Info.naam
            annotation.pinImageName = "Info"
            
            infokantorenAnnotations?.append(annotation)
            
        }
        
        mapview.addAnnotations(infokantorenAnnotations!)
        
    }
    
    /*
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
    */
    
    func createToilettenAnnotation()
    {
        toilettenAnnotations = [CustomPointAnnotation]()
        
        for Toilet in DAO.sharedDAO.getAllSanitair()
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Toilet.lat!)
            let lonStr = Double(Toilet.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Toilet.naam
            annotation.pinImageName = "SanitairS"
            
            toilettenAnnotations?.append(annotation)
            
        }
        
        mapview.addAnnotations(toilettenAnnotations!)
        
    }
    
    func createPOIsAnnotation()
    {
        poisAnnotations = [CustomPointAnnotation]()
        
        for POIs in DAO.sharedDAO.getAllPOIs()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(POIs.lat!)
            let lonStr = Double(POIs.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = POIs.naam
            annotation.pinImageName = "POIS"
            
            poisAnnotations?.append(annotation)
            
        }
        
        mapview.addAnnotations(poisAnnotations!)
        
    }
    
    func createDijkenAnnotation()
    {
        dijkAnnotations = [CustomPointAnnotation]()
        
        for Dijk in DAO.sharedDAO.getAllDijken()!
        {
            let annotation = CustomPointAnnotation()
            
            let latStr = Double(Dijk.lat!)
            let lonStr = Double(Dijk.lon!)
            annotation.coordinate = CLLocationCoordinate2DMake(latStr!, lonStr!)
            annotation.title = Dijk.naam
            annotation.pinImageName = "ZZZS"
            
            dijkAnnotations?.append(annotation)
            
        }
        
        mapview.addAnnotations(dijkAnnotations!)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MapFilterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mapCell")! as! MapFilterTableViewCell
        
        cell.lblFilterNaam?.text = categoryDAO.categoryList[indexPath.row].naam
        cell.lblFilterNaam?.textAlignment = .left
        cell.ivFilterImage?.image = categoryDAO.categoryList[indexPath.row].afbeelding
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            createRestaurantsAnnotation()
            
        case 1:
            createHotelsAnnotation()
            
        case 2:
            createInfoAnnotation()
            
        case 3:
            createToilettenAnnotation()
            
        case 4:
            createTramsAnnotation()
            
        case 5:
            createPOIsAnnotation()
            
        case 6:
            createDijkenAnnotation()
            
        default:
            print("Pin bestaat niet!")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        
        
        switch indexPath.row {
        case 0:
            mapview.removeAnnotations(restaurantsAnnotations!)
            
        case 1:
            mapview.removeAnnotations(hotelsAnnotations!)
            
        case 2:
            mapview.removeAnnotations(infokantorenAnnotations!)
            
        case 3:
            mapview.removeAnnotations(toilettenAnnotations!)
            
        case 4:
            mapview.removeAnnotations(tramhaltesAnnotations!)
            
        case 5:
            mapview.removeAnnotations(poisAnnotations!)
            
        case 6:
            mapview.removeAnnotations(dijkAnnotations!)
            
        default:
            print("Pin is niet verwijderd!")
        }
        
    }
    
    
}




