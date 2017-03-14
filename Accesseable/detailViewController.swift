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
    
    @IBOutlet weak var tvFeature: UITextView!
    var objectPassed:Reca?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the vi
        //connexion needed,can fail so try catch
        
        do {
            //adress to image
            let url = URL.init(string:(objectPassed?.regio)!)
            //convert url tot data
            let data = try Data.init(contentsOf: url!)
            //convert data to image
            let image = UIImage.init(data: data)
            
            ivFeature.image = image
            
        } catch  {
            
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
