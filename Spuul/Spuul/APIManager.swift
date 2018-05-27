//
//  DetailViewController.swift
//  SpuulDemo
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
                completed(false, nil, errorOcccurs.localizedDescription)
                return
            } else {
                
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                    
                    if jsonObj?.count != 0 {
                        completed(true, jsonObj, nil)
                    } else {
                        completed(false, nil, error?.localizedDescription)
                    }
                }
            }
            
        }).resume()
    }

    
}
