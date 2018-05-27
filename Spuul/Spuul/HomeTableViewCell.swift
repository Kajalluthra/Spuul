//
//  HomeTableViewCell.swift
//  SpuulDemo
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var movieTypeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    func setupHomeCell(movieList : MovieList ) {
        self.movieTypeLabel.text = movieList.name
        
        
    }
}


