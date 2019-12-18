//
//  CarruselCell.swift
//  LayoutExample
//
//  Created by Juan Andres Vasquez Ferrer on 12/3/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class CarruselCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView(){
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 6
        containerView.layer.shadowOpacity = 0.7
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
}
