//
//  MainViewController.swift
//  Info Globo
//
//  Created by Fabio Miciano on 13/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView?
    
    override func loadView() {
        guard let view = Bundle.main.loadNibNamed("MainView", owner: self, options: nil)?.last as? UITableView else { return }
        self.tableView = view
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "O Globo"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
