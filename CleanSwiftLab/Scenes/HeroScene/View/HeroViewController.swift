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
    var router: HeroRouterProtocol? {get}
    func displayHero(viewModel: HeroViewModel)
    func renderState(state: SceneState)
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
    
    @objc func backButtonTapped() {
        self.interactor?.change(newState: .collapsed)
    }
    
    @objc func showMoreButtonTapped() {
        self.interactor?.change(newState: .open)
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
    
    func renderState(state: SceneState) {
        guard let view = self.baseView else {return}
        view.changeLayoutView(open: state == .open)
    }
}
