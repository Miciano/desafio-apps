//
//  UIAlertControllerExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 15/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func alert(title:String, message:String, presenter: UIViewController?, handler: ((UIAlertAction) -> Void)?)
    {
        guard let presenter = presenter else { return }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(action)
        
        presenter.present(alert, animated: true, completion: nil)
    }
}
