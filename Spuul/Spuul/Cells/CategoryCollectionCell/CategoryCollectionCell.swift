//
//  CategoryCollectionCell.swift
//  Spuul
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionCell: UICollectionViewCell {
   
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    // MARK:- Allocating values
    func setupMovieCell(selectedItem: Movies) {
        
        self.movieNameLabel.text = selectedItem.movieTitle
        
    }
}

