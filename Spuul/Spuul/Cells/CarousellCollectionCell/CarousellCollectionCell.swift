//
//  CarousellCollectionCell.swift
//  SpuulDemo
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import UIKit
import SDWebImage
class CarousellCollectionCell: UICollectionViewCell {

     @IBOutlet weak var carousellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCarousellCell(selectedItem: String) {
        carousellImageView.sd_setImage(with: URL(string: selectedItem), placeholderImage: UIImage(named: "placeholder"))
    }
}
