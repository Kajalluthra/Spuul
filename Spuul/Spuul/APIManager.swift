//
//  DetailViewController.swift
//  PropertyGuruAssignment
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import Foundation

class APIManager {

    struct ApiRequest {

        static let BaseURL: String = "https://api.myjson.com"
    }
    
    class func shared() -> APIManager {
        return APIManager()
    }
    
    // MARK:- API Method
    func homeTitleApi(completed:@escaping (_ success: Bool, _ response: NSArray?, _ error: String?) -> Void)  {
        
        let urlString = "\(ApiRequest.BaseURL)/bins/ln1oi/"

        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let errorOcccurs = error {
              //error
                
                print(errorOcccurs.localizedDescription)
            } else {
              //success
                
                print(response)

            }
            
        }).resume()
        
    }

    
}
