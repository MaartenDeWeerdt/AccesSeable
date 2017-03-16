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
    @IBOutlet weak var lblNaam: UILabel!
    @IBOutlet weak var lblStraat: UILabel!
    @IBOutlet weak var lblGemeente: UILabel!
    @IBOutlet weak var lblPostcode: UILabel!
    @IBOutlet weak var lblAdres_Nummer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //plaatsen navigatiebar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        //scrollview.contentSize = CGSize.init(width: 375, height: 3000)
        
        //vullen labels
        
        
        lblNaam.text = objectPassed?.value(forKey: "naam") as? String
        lblStraat.text = objectPassed?.value(forKey: "adres_straat") as! String?
        
        //tram en dijk hebben geen deelgemeente -> code aanpassen
        lblGemeente.text = objectPassed?.value(forKey: "deelgemeente") as! String?
        
        //tram heeft geen postcode -> code aanpassen
        lblPostcode.text = objectPassed?.value(forKey: "postcode") as! String?
        
        //tram en dijken hebben geen adres nummer
        lblAdres_Nummer.text = objectPassed?.value(forKey: "adres_nr") as! String?
        
        /*
        lblMail.text = objectPassed?.value(forKey: "mail") as! String?
        
         lbltel.text = objectPassed?.value(forKey: "TEL") as! String?
         lblgsm.text = objectPassed?.value(forKey: "GSM") as! String?
         lblfax.text = objectPassed?.value(forKey: "FAX") as! String?
         lblregio.text = objectPassed?.value(forKey: "REGIO") as! String?
 
        */
        //vullen image
        //tram heeft geen foto -> aanpassen
        if(objectPassed?.value(forKey: "url_picture_main") as! String != "")
        {
            do {
                //adress to image
                let url = URL.init(string:(objectPassed?.value(forKey: "url_picture_main"))! as! String)
                //convert url tot data
                let data = try Data.init(contentsOf: url!)
                //convert data to image
                let image = UIImage.init(data: data)
                
                imgImage.image = image
                
            } catch  {
                
            }
        }
    }
}












