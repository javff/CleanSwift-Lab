//
//  HomeFeedViewController.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import UIKit

protocol HomeViewDisplayLogic: class {
    func displayHome(components: [ComponentsCoreViewModelType])
}

class HomeFeedViewController: BaseViewController <HomeFeedView> {
  
    var interactor: HomeFeedInteractorProtocol?
    var router: HomeFeedRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.getFeed()
    }
    
    private func setupView(){
        navigationItem.title = "Super Hero App"
    }
}

extension HomeFeedViewController : HomeViewDisplayLogic {
   
    func displayHome(components: [ComponentsCoreViewModelType]) {
        for component in components {
            renderCompoent(component: component)
        }
    }
    
    private func renderCompoent(component: ComponentsCoreViewModelType){
        var view: UIView?
        
        switch component {
        case let .carrusel(viewModel):
            let carruselView = CarruselView(viewModel:viewModel)
            carruselView.delegate = self
            view = carruselView
            
        case let .title(viewModel):
            let titleView = TitleView(viewModel: viewModel)
            view = titleView
            
        case let .heroPreview(viewModel):
            let heroPreview = HeroPreviewView(viewModel: viewModel)
            heroPreview.delegate = self
            view = heroPreview
            
        case let .footerButton(viewModel):
            let footerButton = ButtonFooterView(viewModel: viewModel)
            view = footerButton
            
        case .unknown: break
        }
        
        if let view = view{
            baseView?.containerStackView.addArrangedSubview(view)
        }
    }
}

//MARK: - Implement CarruselViewDelegate //
extension HomeFeedViewController: CarruselViewDelegate {
  
    func carruselView(_ carruselView: CarruselView, selected item: CarruselItemViewModel) {
        //TODO: handler carrusel item tapped
    }
}

extension HomeFeedViewController: HeroPreviewViewDelegate {
 
    func heroPreviewView(_ heroPreviewView: HeroPreviewView, tapped hero: HeroPreviewViewModel) {
        router?.navigateToHero(heroPreview: hero)
    }
}
