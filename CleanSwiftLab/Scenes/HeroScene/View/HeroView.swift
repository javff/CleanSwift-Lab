//
//  HeroView.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/8/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class HeroView: BaseView {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var decorationView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var decorationViewAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var decorationViewTopAnchorConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopAnchorConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewCenterConstraint: NSLayoutConstraint!
    
    var isOpen = false
    
    var originalDecorationColor: UIColor?{
        didSet{
            decorationView.backgroundColor = originalDecorationColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        decorationView.layer.cornerRadius = 30
        decorationView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        decorationView.layer.masksToBounds = true
        textView.alpha = 0
    }
    
    func changeLayoutView(open: Bool){
        
        let activeLayoutPriority = UILayoutPriority(750)
        let desactivateLayoutPriority = UILayoutPriority(749)
        let textColor: UIColor = open ? .black : .white
        let decorationColor: UIColor? = open ? .white : originalDecorationColor
        let showMoreAlpha:CGFloat = open ? 0 : 1
        let textViewAlpha: CGFloat = open ? 1 : 0
        decorationViewAspectRatioConstraint.priority = open ? desactivateLayoutPriority : activeLayoutPriority
        decorationViewTopAnchorConstraint.priority = open ? activeLayoutPriority : desactivateLayoutPriority
        imageViewTopAnchorConstraint.priority = open ? activeLayoutPriority : desactivateLayoutPriority
        imageViewCenterConstraint.priority = open ? desactivateLayoutPriority : activeLayoutPriority
        heroNameLabel.alpha = 0
        realNameLabel.alpha = 0
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.calculationModeCubic], animations: {[weak self] in
            
            guard let self = self else {return}
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration:0.25, animations: {
                self.showMoreButton.alpha = showMoreAlpha
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                self.decorationView.backgroundColor = decorationColor
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.heroNameLabel.alpha = 1
                self.realNameLabel.alpha = 1
                self.realNameLabel.textColor = textColor
                self.heroNameLabel.textColor = textColor
            })

            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.textView.alpha = textViewAlpha
            })
            
        }) { (_) in
            self.isOpen = open
        }
    }
    
}
