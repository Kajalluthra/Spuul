//
//  HomeViewController.swift
//  Spuul
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    let manager = MoviesManager()
    let loadinScreen = LoadingView.newInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
    }

    func setupUI() {
       
        self.loadinScreen.show()
        let movieListNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(movieListNib, forCellReuseIdentifier: "homeCell")
        
        self.manager.delegate = self
        self.manager.loadContentForMoviesList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//MARK:- MoviesManagerDelegate Protocol Method
extension HomeViewController : MoviesManagerDelegate {
    
    @objc internal func didUpdateList() {
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
            self.loadinScreen.hide()
        }
    }
    
    @objc internal func didUpdateErrorWithAlert( error: String){
       
        //show alert
         self.loadinScreen.hide()
    }
}

