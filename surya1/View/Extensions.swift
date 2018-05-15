//
//  Extensions.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // add alert to view to showcase error
    func showAlert(msg : String) {
        let alertViewController = UIAlertController(title: "Test", message: msg, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertViewController.addAction(dismissAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
}
