//
//  NoticeImageView.swift
//  Info Globo
//
//  Created by Fabio Miciano on 15/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class NoticeImageView: UIView, Constraints {
    
    lazy var request = {
        return MainRequests()
    }()
    
    fileprivate var imageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        startActivityView()
    }
    
    func createImage(url: String) {
        
        self.isHidden = false
        
        if url == "" {
            for view in self.subviews { view.removeFromSuperview() }
            self.isHidden = true
            return
        }
        
        request.getImage(url: url) {[weak self] (response) in
            switch response {
            case .success(let model):
                self?.createOnPhoto(with: model)
            case .downloadCanceled( _):
                self?.createImage(url: url)
            case .invalidResponse:
                fatalError("Response de imagem inválido")
            }
        }
    }
    
    fileprivate func createOnPhoto(with image:UIImage)
    {
        removeActivityView()
        
        let imageView = UIImageView(image: image)
        self.insertSubview(imageView, at: 0)
        addConstraints(imageView, toItem: self, attributes: [.top, .leading, .trailing, .bottom], constants: [0,0,0,0])
    }
    
    fileprivate func startActivityView() {
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .white)
        addSubview(activity)
        activity.startAnimating()
        
        addConstraints(activity, toItem: self, attributes: [.centerX, .centerY], constants: [0,0])
    }
    
    fileprivate func removeActivityView() {
        
        for view in self.subviews {
            if view is UIActivityIndicatorView { view.removeFromSuperview() }
        }
    }
}
