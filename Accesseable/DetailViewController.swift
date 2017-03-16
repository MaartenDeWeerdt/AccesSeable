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
    
    @IBOutlet weak var scrollview: UIScrollView!
    var objectPassed:NSManagedObject?
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblNaam: UILabel!
    @IBOutlet weak var lbladress: UITextField!
    @IBOutlet weak var lblregio: UITextField!
    @IBOutlet weak var lblfax: UITextField!
    @IBOutlet weak var lblgsm: UITextField!
    @IBOutlet weak var lbltel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        scrollview.contentSize = CGSize.init(width: 375, height: 3000)
        
        lblNaam.text = objectPassed?.value(forKey: "naam") as? String
        /*
         lbladress.text = objectPassed?.value(forKey: "ADRES_STRAAT") as? String
         lbltel.text = objectPassed?.value(forKey: "TEL") as! String?
         lblgsm.text = objectPassed?.value(forKey: "GSM") as! String?
         lblfax.text = objectPassed?.value(forKey: "FAX") as! String?
         lblregio.text = objectPassed?.value(forKey: "REGIO") as! String?
         */
        
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












