//
//  MainViewController.swift
//  Info Globo
//
//  Created by Fabio Miciano on 13/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit
import KVNProgress

class MainViewController: UIViewController {
    
    var tableView: UITableView?
    
    lazy var dataSource = {
        return [NoticeModel]()
    }()
    
    lazy var itens = {
        return [CellItem]()
    }()
    
    lazy var cellFactory = {
       return CellFactory()
    }()
    
    lazy var request = {
        return MainRequests()
    }()
    
    var refreshControl = UIRefreshControl()
    
    override func loadView() {
        guard let view = Bundle.main.loadNibNamed("MainView", owner: self, options: nil)?.last as? UITableView else { return }
        self.tableView = view
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "O Globo"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.15, green:0.45, blue:0.65, alpha:1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = UIColor.white
        
        tableView?.register(UINib(nibName: "\(MainCoverCell.self)", bundle: nil), forCellReuseIdentifier: MainCoverCell.cellIdentifier)
        tableView?.register(UINib(nibName: "\(CoverCell.self)", bundle: nil), forCellReuseIdentifier: CoverCell.cellIdentifier)
        tableView?.register(UINib(nibName: "\(LoadCell.self)", bundle: nil), forCellReuseIdentifier: LoadCell.cellIdentifier)
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        tableView?.addSubview(refreshControl)
        
        loadInformation()
    }
    
    func refreshTable() {
        
        dataSource.removeAll()
        itens.removeAll()
        
        loadInformation()
    }
    
    fileprivate func loadInformation() {
        KVNProgress.show(withStatus: "Carrengando...")
        
        request.getNotices { [weak self](response) in
            KVNProgress.dismiss()
            guard let refreshControl = self?.refreshControl else { return }
            if refreshControl.isRefreshing { refreshControl.endRefreshing() }
            
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
        
        for content in model {
            for notices in content.notices{
                dataSource.append(notices)
                let imageUrl = notices.imagens.count > 0 ? notices.imagens[0].url : ""
                if itens.count == 0 {
                    itens.append(.mainCover(model: CoverCellModel(photoNotice: imageUrl, section: notices.section?.name, title: notices.title)))
                }
                else {
                    itens.append(.cover(model: CoverCellModel(photoNotice: imageUrl, section: notices.section?.name, title: notices.title)))
                }
            }
        }
        
        tableView?.estimatedRowHeight = 170.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if itens.count > 0 {
            let cell = cellFactory.buildCell(for: itens[indexPath.row], at: indexPath, on: tableView)
            
            if let completeCell = cell { return completeCell }
            else { fatalError("Erro ao criar a célula na linha \(indexPath.row)") }
        }
        
        return tableView.dequeueReusableCell(withIdentifier: LoadCell.cellIdentifier, for: indexPath)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DetailViewController(noticeModel: dataSource[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}
