//
//  HeroViewController.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/8/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol HeroViewDisplayLogic: class {
    func displayHero(viewModel: HeroViewModel)
}

class HeroViewController: BaseViewController<HeroView> {
    
    var interactor: HeroInteractorProtocol?
    var router: HeroRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        interactor?.getHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupEvents(){
        baseView?.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        baseView?.showMoreButton.addTarget(self, action: #selector(showMoreButtonTapped), for: .touchUpInside)

    }
    
    @objc func backButtonTapped(){
        if baseView?.isOpen ?? false {
            baseView?.changeLayoutView(open: false)
            return
        }
        router?.goToBack()
    }
    
    @objc func showMoreButtonTapped(){
        
        guard let baseView = baseView else {
            return
        }
        
        baseView.changeLayoutView(open: !baseView.isOpen)
    }
}

extension HeroViewController: HeroViewDisplayLogic {
    func displayHero(viewModel: HeroViewModel) {
        baseView?.imageView.image = UIImage(named: viewModel.imageName)
        baseView?.heroNameLabel.text = viewModel.heroName
        baseView?.realNameLabel.text = viewModel.realName
        baseView?.originalDecorationColor = UIColor(hex: viewModel.hexColor)
        baseView?.textView.text = viewModel.description
    }
    
    
}
