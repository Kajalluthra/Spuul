//
//  ViewController.swift
//  Spuul
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    func setupUI() {
        let movieListNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(movieListNib, forCellReuseIdentifier: "homeCell")
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        return cell
    }
}
