//
//  ViewController.swift
//  Accesseable
//
//  Created by mobapp09 on 10/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var rows = [TableViewRow]()
    var selectedCat:Int = 0
    
    @IBOutlet weak var tabBarCollection: UICollectionView!
    @IBOutlet weak var CategorieCollection: UICollectionView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rows.append(TableViewRow.init(title: "Restaurants", items: DAO.sharedDAO.getAllRestaurants()!))
        rows.append(TableViewRow.init(title: "Hotels", items: DAO.sharedDAO.getAllHotels()))
        rows.append(TableViewRow.init(title: "Infokantoren", items: DAO.sharedDAO.getAllInfo()))
        rows.append(TableViewRow.init(title: "Parkings", items: DAO.sharedDAO.getAllParkings()))
        rows.append(TableViewRow.init(title: "Toiletten", items: DAO.sharedDAO.getAllSanitair()))
        rows.append(TableViewRow.init(title: "Tramhaltes", items: DAO.sharedDAO.getAllTrams()!))
        rows.append(TableViewRow.init(title: "Interessante locaties", items: DAO.sharedDAO.getAllPOIs()!))
        rows.append(TableViewRow.init(title: "Dijken", items: DAO.sharedDAO.getAllDijken()!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
            return rows.count
        }
        else
        {
            return rows[selectedCat].items.count
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 1{
            return 1
        }
        else
        {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabbarCell", for: indexPath) as! TabbarCollectionViewCell
            cell.lblCategorie.text = rows[indexPath.row].title
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            switch selectedCat {
            case 0:
                cell.lblNaam.text = rows[selectedCat].items[indexPath.row].value(forKey: "naam") as? String
                cell.lblAdres.text = rows[selectedCat].items[indexPath.row].value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = rows[selectedCat].items[indexPath.row].value(forKey: "gemeente") as? String
            case 1:
                cell.lblNaam.text = rows[selectedCat].items[indexPath.row].value(forKey: "naam") as? String
                cell.lblAdres.text = rows[selectedCat].items[indexPath.row].value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = rows[selectedCat].items[indexPath.row].value(forKey: "gemeente") as? String
            default:
                print("deze collectie bestaat niet")
            }
            return cell
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            selectedCat = indexPath.row
        
            CategorieCollection.reloadData()
        }
    }
}

