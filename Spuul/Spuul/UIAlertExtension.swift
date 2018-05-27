//
//  UIAlertExtension.swift
//  Spuul
//
//  Created by Kajal on 27/5/2018.
//  Copyright © 2018 Kajal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK:- Alerts
    func showAlertPopUp(message: String) {
        let alertController = UIAlertController(title: Constants.AppName, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


