//
//  CellFactory.swift
//  Info Globo
//
//  Created by Fabio Miciano on 14/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

public enum CellItem {
    
    case mainCover(model: CoverCellModel)
    case cover(model: CoverCellModel)
}

struct CellFactory {
    
    func buildCell(for cellItem: CellItem, at indexPath: IndexPath, on tableView: UITableView)-> UITableViewCell? {
        
        switch cellItem {
        case .mainCover(let model):
            return tableView.loadNoticeCell(with: MainCoverCell.cellIdentifier, at: indexPath, model: model)
        case .cover(let model):
            return tableView.loadNoticeCell(with: CoverCell.cellIdentifier, at: indexPath, model: model)
        }
    }
}
