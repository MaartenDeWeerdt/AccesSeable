//
//  TableViewCell.swift
//  Accesseable
//
//  Created by mobapp09 on 14/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit
import CoreData
 //var tableData = []
class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var items:[NSManagedObject]?
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //collectionview in tableview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items!.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        let object:NSManagedObject = (items?[indexPath.row])!
        cell.lblNaam.text = object.value(forKey: "naam") as! String?
        
        print("collection in cell")
        
        return cell
        
   
    
    
    }
    
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cellsegue")
       
        if let rowData: NSDictionary = self.tableData[indexPath.row] as? NSDictionary,
            // Prenez la clé ........... pour obtenir l'URL d'une image pour la miniature de l'application
            let urlString = rowData[""] as? String,
            // Créez une instance de NSURL à partir de l'URL sous forme de chaîne que nous recevons de l'API
            let imgURL = NSURL(string: urlString),
           
            // Téléchargez une représentation NSData de l'image à cette URL
            let imgData = NSData(contentsOf: imgURL as URL),
            
            
            // Obtenez le titre du morceau
            let nomMorceau = rowData[""] as? String {
          
            // Mettez à jour la cellule imageWiew pour afficher l'image téléchargée
            cell.imageView?.image = UIImage(data: imgData as Data)
            // Mettez à jour le texte de textLabel pour afficher le nom du morceau obtenu de l'API
            cell.textLabel?.text = nomMorceau
        }     
        return cell
    }
    */
    
}

