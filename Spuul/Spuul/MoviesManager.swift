//
//  MoviesManager.swift
//  SpuulDemo
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import Foundation
import UIKit

@objc protocol MoviesManagerDelegate: class {
    
    func didUpdateList()
    func didUpdateErrorWithAlert( error: String)
}


class MoviesManager: NSObject {
    
    var movieListArray:[MovieList] = [MovieList]()

    weak var delegate: MoviesManagerDelegate?
    let apiInstance = APIManager()

    override init() {
        super.init()
    }
    
    func loadContentForMoviesList() {
        
        self.apiInstance.homeTitleApi { (success, response, error) in
            if success {
                
                for news in response!{
                    let dictnews = news as! NSDictionary
                    let model = MovieList(info: dictnews)
                    self.movieListArray.append(model)
                }
                
               self.delegate?.didUpdateList()
                
            } else {
                self.delegate?.didUpdateErrorWithAlert(error: error!)
            }
        }

    }
    
    
    
}

