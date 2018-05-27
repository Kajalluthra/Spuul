//
//  HomeViewController.swift
//  Spuul
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    
    // MARK:- Variables
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var carousellCollectionView : UICollectionView!
    
    let manager = MoviesManager()
    let loadinScreen = LoadingView.newInstance()
    var carousellArray = NSArray()
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        self.loadinScreen.show()
        self.navigationItem.title = Constants.AppName
        
        let movieListNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(movieListNib, forCellReuseIdentifier: "homeCell")
        
        let nibCarousell = UINib(nibName: "CarousellCollectionCell", bundle: nil)
        self.carousellCollectionView.register(nibCarousell, forCellWithReuseIdentifier: "carousellCell")
        
        carousellArray = [carousellImage1,carousellImage2,carousellImage3]
        
        self.manager.delegate = self
        self.manager.loadContentForMoviesList()
        startTimer()
        
    }
    
    // MARK:- CarousellTimer
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextImage), userInfo: nil, repeats: true);
    }
    
    @objc func scrollToNextImage(){
        
        //get cell size
        let cellSize = CGSize(width: self.view.frame.width, height: 200)
        
        //get current content Offset of the Collection view
        let contentOffset = carousellCollectionView.contentOffset;
        
        if carousellCollectionView.contentSize.width <= carousellCollectionView.contentOffset.x + cellSize.width {
            carousellCollectionView.scrollRectToVisible(CGRect(x:0, y:contentOffset.y, width: cellSize.width, height:200), animated: false);
            
        } else {
            carousellCollectionView.scrollRectToVisible(CGRect(x:contentOffset.x + cellSize.width, y: contentOffset.y, width:cellSize.width, height: 200), animated: true);
            
        }
        
    }
    
}

//MARK:- MoviesManagerDelegate Protocol Method
extension HomeViewController : MoviesManagerDelegate {
    
    @objc internal func didUpdateList() {
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
            self.loadinScreen.hide()
        }
    }
    
    @objc internal func didUpdateErrorWithAlert( error: String){
        DispatchQueue.main.async {
            self.showAlertPopUp(message: error)
            self.loadinScreen.hide()
        }
    }
}

//MARK:- UITableViewDataSource
extension HomeViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manager.movieListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        cell.setupHomeCell(movieList: self.manager.movieListArray[indexPath.row], movies: self.manager.moviesArray)
        return cell
    }
}

//MARK:- UICollectionViewDelegate

extension HomeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carousellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carousellCell", for: indexPath) as! CarousellCollectionCell
        cell.setupCarousellCell(selectedItem: carousellArray[indexPath.row] as! String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width, height: 200)
    }
}


