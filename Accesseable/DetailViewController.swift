//
//  detailViewController.swift
//  Accesseable
//
//  Created by mobapp04 on 14/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
      var objectPassed:NSManagedObject?
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var lblNaam: UILabel!
    @IBOutlet weak var lblStraat: UILabel!
    @IBOutlet weak var lblGemeente: UILabel!
    @IBOutlet weak var lblPostcode: UILabel!
    @IBOutlet weak var lblAdres_Nummer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //plaatsen navigatiebar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        //vullen labels
        //kijken welk type object doorgestuurd wordt dmv de entiteit
        
        //tram
        if objectPassed is Tram
        {
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblTitel.text = "Toegankelijkheid"
            lblStraat.text = "toegankelijk met rolstoel:"
            if Int32((objectPassed?.value(forKey: "weelchair_boarding") as? String)!)! == 1
            {
                lblAdres_Nummer.text = "ja"
            }
            else
            {
                lblAdres_Nummer.text = "nee"
            }
            lblGemeente.text = ""
            lblPostcode.text = ""
            imgImage.image = #imageLiteral(resourceName: "tram.png")
        }
            
        //dijk
        else if objectPassed is Dijk
        {
            lblTitel.text = "Adres"
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblStraat.text = objectPassed?.value(forKey: "adres_locatie") as! String?
            lblGemeente.text = objectPassed?.value(forKey: "gemeente") as! String?
            lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?

            if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
            {
                do {
                    let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                    let data = try Data.init(contentsOf: url!)
                    let image = UIImage.init(data: data)
                    imgImage.image = image
                } catch  {}
            }
            else { imgImage.image = #imageLiteral(resourceName: "ZZZ.png") }
        }
        //restaurant
        else if objectPassed is Reca
        {
            lblTitel.text = "Adres"
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblStraat.text = objectPassed?.value(forKey: "adres_straat") as! String?
            lblGemeente.text = objectPassed?.value(forKey: "deelgemeente") as! String?
            lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?
            lblAdres_Nummer.text = objectPassed?.value(forKey: "adres_nr") as! String?
            
            if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
            {
                do {
                    let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                    let data = try Data.init(contentsOf: url!)
                    let image = UIImage.init(data: data)
                    imgImage.image = image
                } catch  {}
            }
            else { imgImage.image = #imageLiteral(resourceName: "Restaurant.png") }
        }
        //hotels
        else if objectPassed is Logies
        {
            lblTitel.text = "Adres"
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblStraat.text = objectPassed?.value(forKey: "adres_straat") as! String?
            lblGemeente.text = objectPassed?.value(forKey: "deelgemeente") as! String?
            lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?
            lblAdres_Nummer.text = objectPassed?.value(forKey: "adres_nr") as! String?
            
            if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
            {
                do {
                    let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                    let data = try Data.init(contentsOf: url!)
                    let image = UIImage.init(data: data)
                    imgImage.image = image
                } catch  {}
            }
            else { imgImage.image = #imageLiteral(resourceName: "home.png") }
        }
        //infokantoor
        else if objectPassed is Info
        {
            lblTitel.text = "Adres"
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblStraat.text = objectPassed?.value(forKey: "adres_straat") as! String?
            lblGemeente.text = objectPassed?.value(forKey: "deelgemeente") as! String?
            lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?
            lblAdres_Nummer.text = objectPassed?.value(forKey: "adres_nr") as! String?
            
            if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
            {
                do {
                    let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                    let data = try Data.init(contentsOf: url!)
                    let image = UIImage.init(data: data)
                    imgImage.image = image
                } catch  {}
            }
            else { imgImage.image = #imageLiteral(resourceName: "Info.png") }
        }
        //wc
        else if objectPassed is Sanitair
        {
            lblTitel.text = "Adres"
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblStraat.text = objectPassed?.value(forKey: "adres_straat") as! String?
            lblGemeente.text = objectPassed?.value(forKey: "deelgemeente") as! String?
            lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?
            lblAdres_Nummer.text = objectPassed?.value(forKey: "adres_nr") as! String?
            
            if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
            {
                do {
                    let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                    let data = try Data.init(contentsOf: url!)
                    let image = UIImage.init(data: data)
                    imgImage.image = image
                } catch  {}
            }
            else { imgImage.image = #imageLiteral(resourceName: "Sanitair.png") }
        }
        //Poi
        else if objectPassed is POI
        {
            lblTitel.text = "Adres"
            lblNaam.text = objectPassed?.value(forKey: "naam") as? String
            lblStraat.text = objectPassed?.value(forKey: "adres_straat") as! String?
            lblGemeente.text = objectPassed?.value(forKey: "deelgemeente") as! String?
            lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?
            lblAdres_Nummer.text = objectPassed?.value(forKey: "adres_nr") as! String?
            
            if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
            {
                do {
                    let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                    let data = try Data.init(contentsOf: url!)
                    let image = UIImage.init(data: data)
                    imgImage.image = image
                } catch  {}
            }
            else { imgImage.image = #imageLiteral(resourceName: "POI.png") }
        }
    }
}












