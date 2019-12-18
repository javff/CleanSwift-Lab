//
//  HeroPreviewView.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/8/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol HeroPreviewViewDelegate: class {
    func heroPreviewView(_ heroPreviewView: HeroPreviewView,
                      tapped hero: HeroPreviewViewModel)
}

class HeroPreviewView: BaseView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let viewModel: HeroPreviewViewModel
    weak var delegate: HeroPreviewViewDelegate?
    
    init(frame: CGRect = .zero, viewModel: HeroPreviewViewModel){
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
        setupGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        imageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.content
        
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.layer.shadowRadius = 12
        containerView.layer.shadowOpacity = 0.7
        
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        imageView.layer.masksToBounds = true
        
    }
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.cardTapped))
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func cardTapped(){
        delegate?.heroPreviewView(self, tapped: viewModel)
    }
    
}
