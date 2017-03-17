//
//  ViewController.swift
//  Accesseable
//
//  Created by mobapp09 on 10/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {

    var rows = [TableViewRow]()
    var selectedCat:Int = 0
    var gefilterdeCollectie = [NSManagedObject]()
    
    @IBOutlet weak var tabBarCollection: UICollectionView!
    @IBOutlet weak var CategorieCollection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        rows.append(TableViewRow.init(title: "Restaurants", items: DAO.sharedDAO.getAllRestaurants()!))
        rows.append(TableViewRow.init(title: "Hotels", items: DAO.sharedDAO.getAllHotels()))
        rows.append(TableViewRow.init(title: "Infokantoren", items: DAO.sharedDAO.getAllInfo()))
        //rows.append(TableViewRow.init(title: "Parkings", items: DAO.sharedDAO.getAllParkings()))
        rows.append(TableViewRow.init(title: "Toiletten", items: DAO.sharedDAO.getAllSanitair()))
        rows.append(TableViewRow.init(title: "Tramhaltes", items: DAO.sharedDAO.getAllTrams()!))
        rows.append(TableViewRow.init(title: "POI", items: DAO.sharedDAO.getAllPOIs()!))
        rows.append(TableViewRow.init(title: "Dijken", items: DAO.sharedDAO.getAllDijken()!))
        
        gefilterdeCollectie = rows[selectedCat].items
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
            return rows.count
        }
        else
        {
            //volledige lijst returnen
            return gefilterdeCollectie.count
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
            var item:NSManagedObject

            item = gefilterdeCollectie[indexPath.row]

            
            //let item = gefilterdeCollectie[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            
            //als searchcontroller actief en niet leeg is -> filteren, anders niet
            
            switch selectedCat {
                
            case 0:
                //restaurants
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.lblAdres.text = item.value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = item.value(forKey: "deelgemeente") as? String
                
                if(item.value(forKey: "url_picture_main") as? String != "")
                {
                    do {
                        //adress to image
                        let url = URL.init(string: (item.value(forKey: "url_picture_main") as? String)!)
                        //convert url tot data
                        let data = try Data.init(contentsOf: url!)
                        //convert data to image
                        cell.imgFoto.image = UIImage.init(data: data)
                    } catch  {
                        print("foto niet gevonden")
                    }
                }
                else
                {
                    //als er geen foto is -> standaard foto
                    cell.imgFoto.image = #imageLiteral(resourceName: "Restaurant.png")
                }

                
                
            case 1:
                //hotels
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.lblAdres.text = item.value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = item.value(forKey: "deelgemeente") as? String
                
                if(item.value(forKey: "url_picture_main") as? String != "")
                {
                    do {
                        //adress to image
                        let url = URL.init(string: (item.value(forKey: "url_picture_main") as? String)!)
                        //convert url tot data
                        let data = try Data.init(contentsOf: url!)
                        //convert data to image
                        cell.imgFoto.image = UIImage.init(data: data)
                    } catch  {
                        print("foto niet gevonden")
                    }
                }
                else
                {
                    //als er geen foto is -> standaard foto
                    cell.imgFoto.image = #imageLiteral(resourceName: "home.png")
                }

                
            case 2:
                //infokantoren
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.lblAdres.text = item.value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = item.value(forKey: "deelgemeente") as? String
                
                if(item.value(forKey: "url_picture_main") as? String != "")
                {
                    do {
                        //adress to image
                        let url = URL.init(string: (item.value(forKey: "url_picture_main") as? String)!)
                        //convert url tot data
                        let data = try Data.init(contentsOf: url!)
                        //convert data to image
                        cell.imgFoto.image = UIImage.init(data: data)
                    } catch  {
                        print("foto niet gevonden")
                    }
                }
                else
                {
                    //als er geen foto is -> standaard foto
                    cell.imgFoto.image = #imageLiteral(resourceName: "Info.png")
                }

                

                
            case 3:
                //toiletten
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.lblAdres.text = item.value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = item.value(forKey: "deelgemeente") as? String
                
                if(item.value(forKey: "url_picture_main") as? String != "")
                {
                    do {
                        //adress to image
                        let url = URL.init(string: (item.value(forKey: "url_picture_main") as? String)!)
                        //convert url tot data
                        let data = try Data.init(contentsOf: url!)
                        //convert data to image
                        cell.imgFoto.image = UIImage.init(data: data)
                    } catch  {
                        print("foto niet gevonden")
                    }
                }
                else
                {
                    //als er geen foto is -> standaard foto
                    cell.imgFoto.image = #imageLiteral(resourceName: "Sanitair.png")
                }
                
            case 4:
                //tramhaltes
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.imgFoto.image = #imageLiteral(resourceName: "tram.png")
            case 5:
                //interessante locaties
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.lblAdres.text = item.value(forKey: "adres_straat") as? String
                cell.lblGemeente.text = item.value(forKey: "deelgemeente") as? String
                
                
                if(item.value(forKey: "url_picture_main") as? String != "")
                {
                    do {
                        //adress to image
                        let url = URL.init(string: (item.value(forKey: "url_picture_main") as? String)!)
                        //convert url tot data
                        let data = try Data.init(contentsOf: url!)
                        //convert data to image
                        cell.imgFoto.image = UIImage.init(data: data)
                    } catch  {
                        print("foto niet gevonden")
                    }
                }
                else
                {
                    //als er geen foto is -> standaard foto
                    cell.imgFoto.image = #imageLiteral(resourceName: "POI.png")
                }
                
            case 6:
                //dijken
                cell.lblNaam.text = item.value(forKey: "naam") as? String
                cell.lblAdres.text = item.value(forKey: "adres_locatie") as? String
                cell.lblGemeente.text = item.value(forKey: "gemeente") as? String
                
                if(item.value(forKey: "url_picture_main") as? String != "")
                {
                    do {
                        //adress to image
                        let url = URL.init(string: (item.value(forKey: "url_picture_main") as? String)!)
                        //convert url tot data
                        let data = try Data.init(contentsOf: url!)
                        //convert data to image
                        cell.imgFoto.image = UIImage.init(data: data)
                    } catch  {
                        print("foto niet gevonden")
                    }
                }
                else
                {
                    //als er geen foto is -> standaard foto
                    cell.imgFoto.image = #imageLiteral(resourceName: "ZZZ.png")
                }
                
                //komt normaal nooit voor
            default:
                print("deze collectie bestaat niet")
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            selectedCat = indexPath.row
            gefilterdeCollectie = rows[selectedCat].items
        
            CategorieCollection.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let cell = sender as! CollectionViewCell
        
        let index:IndexPath = CategorieCollection.indexPath(for: cell)!
        
        detailViewController.objectPassed = rows[selectedCat].items[index.row]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let temp = NSMutableArray.init(array: rows[selectedCat].items)
        let filter = NSPredicate.init(format: "naam CONTAINS[c] %@", searchText)

        gefilterdeCollectie = temp.filtered(using: filter) as! [NSManagedObject]
        
        if(searchText == "" )
        {
            gefilterdeCollectie =  rows[selectedCat].items
        }
        
        CategorieCollection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

