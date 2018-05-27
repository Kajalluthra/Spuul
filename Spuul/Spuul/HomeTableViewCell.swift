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
    var moviesArray:[Movies] = [Movies]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nibCategory = UINib(nibName: "CategoryCollectionCell", bundle: nil)
        self.myCollectionView.register(nibCategory, forCellWithReuseIdentifier: "cell1")
    }
    
    func setupHomeCell(movieList : MovieList, movies: [Movies] ) {
        self.movieTypeLabel.text = movieList.name
        self.moviesArray = movies
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.reloadData()
    }
}

//MARK:- UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension HomeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CategoryCollectionCell
        cell.setupMovieCell(selectedItem: self.moviesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.001
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.001
    }
    
}
