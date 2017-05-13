//
//  ViewController.swift
//  Info Globo
//
//  Created by Fabio Miciano on 11/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadJson()
    }
    
    func loadJson() {
        let request = MainRequests()
        request.getNotices { (response) in
            
            switch response {
            case .success(let model):
                print("SUCCESS = \(String(describing: model))")
            case .serverError(let description):
                print("ERROR = \(description)")
            case .noConnection(let description):
                print("NO CONNECTION = \(description)")
            case .timeOut(let description):
                print("TIME OUT = \(description)")
            case .cancelled:
                print("==== canceled ===")
                self.loadJson()
            case .invalidResponse:
                fatalError("Response inválido")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

