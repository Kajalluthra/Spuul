//
//  Movies.swift
//  SpuulDemo
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import Foundation
import UIKit

class MovieList: NSObject {
    
    var name: String?
    
    override init() {
        name = ""
    }
    
    convenience init(info: AnyObject) {
        self.init()
        let nameValue: String? = info.value(forKeyPath: "listing.title") as? String
        self.name = (nameValue != nil) ? nameValue : ""
    }

}

class Movies: NSObject {
    
    var movieTitle : String?
    var movieUrl : String?
    
    override init() {
        movieTitle = ""
        movieUrl = ""
    }
    
    convenience init(info: AnyObject) {
        self.init()
        let title: String? = info.value(forKey: "title") as? String
        self.movieTitle = (title != nil) ? title : ""
        
        let url: String? = info.value(forKeyPath: "cover.large") as? String
        self.movieUrl = (url != nil) ? url : ""                
    }
    
}

