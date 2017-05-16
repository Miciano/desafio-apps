//
//  CellFactory.swift
//  Info Globo
//
//  Created by Fabio Miciano on 14/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

//FABRICA DE CELULAS CRIADA PARA FACILITAR A CRIACAO DE CELULAS DE DIFERENTES LAYOUTS

//Tipos de celulas que podem ser criados
public enum CellItem {
    
    case mainCover(model: CoverCellModel)
    case cover(model: CoverCellModel)
}

struct CellFactory {
    
    //Função retorna a celula que será criada de acordo com o tipo de celula
    func buildCell(for cellItem: CellItem, at indexPath: IndexPath, on tableView: UITableView)-> UITableViewCell? {
        
        switch cellItem {
        case .mainCover(let model):
            return tableView.loadNoticeCell(with: MainCoverCell.cellIdentifier, at: indexPath, model: model)
        case .cover(let model):
            return tableView.loadNoticeCell(with: CoverCell.cellIdentifier, at: indexPath, model: model)
        }
    }
}
