//
//  detailViewController.swift
//  Accesseable
//
//  Created by mobapp04 on 14/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit
import CoreData

class detailViewController: UIViewController {

    @IBOutlet weak var ivFeature: UIImageView!

      var objectPassed:NSManagedObject?

    
    @IBOutlet weak var lbladress: UITextField!
    
    @IBOutlet weak var lblregio: UITextField!
    @IBOutlet weak var lblfax: UITextField!
    @IBOutlet weak var lblgsm: UITextField!
    @IBOutlet weak var lblmail: UITextField!
    @IBOutlet weak var lbltel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        lbladress.text = objectPassed?.value(forKey: "adres_straat") as? String
        // lbltel.text = objectPassed?.tel
        //lblmail.text = objectPassed?.mail
        //lblgsm.text = objectPassed?.gsm
         //lblfax.text = objectPassed?.fax
       // lblregio.text = objectPassed?.regio
   do {
            //adress to image
            let url = URL.init(string:(objectPassed?.value(forKey: "http://www.westkans.be/download/foto/LOG-052a.JPG"))! as! String)
            //convert url tot data
            let data = try Data.init(contentsOf: url!)
            //convert data to image
            let image = UIImage.init(data: data)
            
            ivFeature.image = image
            
        } catch  {
            
        }
     
     
              }
       
        
 
    }




    


