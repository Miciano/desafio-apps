//
//  UITableViewExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 15/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    //Função de criaçnao de celulas
    func loadNoticeCell(with identifier: String, at indexPath: IndexPath, model: CoverCellModel)-> UITableViewCell?  {
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        guard let noticeCell = cell as? NoticeCell else { return nil }
        noticeCell.configure(with: model)
        
        return noticeCell
    }
}
