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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        
        cell.items = rows[indexPath.section].items
        print("cell made")
        
        return cell
    }
   
    
    
    //tabbar
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorieën.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            selectedCat = indexPath.row
        
            CategorieCollection.reloadData()
        }
    }
}

