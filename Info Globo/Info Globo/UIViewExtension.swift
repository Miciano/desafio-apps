//
//  UIViewExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 16/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    //Pega o tamanho real da view
    func realHeigthView() -> CGFloat {
        
        var realHeight:CGFloat = 0
        
        for view in self.subviews {
            if view.isHidden == false {
                let sum = view.frame.origin.y + view.frame.height
                if sum > realHeight { realHeight = sum }
            }
        }
        
        return realHeight
    }
}
