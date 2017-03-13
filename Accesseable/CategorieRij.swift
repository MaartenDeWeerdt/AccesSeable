//
//  CategorieRow.swift
//  Accesseable
//
//  Created by mobapp09 on 10/03/17.
//  Copyright © 2017 mobapp09. All rights reserved.
//

import UIKit

class CategorieRij: UITableViewCell {}

extension CategorieRij: UICollectionViewDataSource{
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "objectCell", for: indexPath) as! CategorieCollectionViewCell
        
        
        
        return cell
    }
}

extension CategorieRij: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRij:CGFloat = 4
        let Padding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRij) - Padding
        let itemHeight = collectionView.bounds.height - (2 * Padding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
}
