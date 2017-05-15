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
    var contentDataSource: [ContentModel]?
    var noticesDataSource: [NoticeModel]?
    
    lazy var cellFactory = {
       return CellFactory()
    }()
    
    lazy var request = {
        return MainRequests()
    }()
    
    override func loadView() {
        guard let view = Bundle.main.loadNibNamed("MainView", owner: self, options: nil)?.last as? UITableView else { return }
        self.tableView = view
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "O Globo"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor(red:0.15, green:0.45, blue:0.65, alpha:1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.barStyle = .black
    }
    
    fileprivate func loadInformation() {
        request.getNotices { [weak self](response) in
            switch response {
            case .success(let model):
                guard let model = model else { return }
                self?.incrementDataSource(model: model)
            case .noConnection(let description):
                UIAlertController.alert(title: "Atenção", message: description.msgError, presenter: self, handler: nil)
            case .serverError(let description):
                UIAlertController.alert(title: "Atenção", message: description.msgError, presenter: self, handler: nil)
            case .timeOut(let description):
                UIAlertController.alert(title: "Atenção", message: description.msgError, presenter: self, handler: nil)
            case .invalidResponse:
                fatalError("Response de noticias inválido")
            case .cancelled:
                self?.loadInformation()
            }
        }
    }
    
    fileprivate func incrementDataSource(model: [ContentModel]) {
        
        
        //tableView?.dataSource = self
        tableView?.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/*extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = dataSource else { return 0 }
        return dataSource[0].notices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellFactory.buildCell(for: <#T##CellItem#>, at: <#T##IndexPath#>, on: <#T##UITableView#>)
    }
}*/
