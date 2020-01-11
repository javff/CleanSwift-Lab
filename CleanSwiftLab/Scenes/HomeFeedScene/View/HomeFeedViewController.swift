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
    var router: (HomeFeedRouterProtocol & ComponentsRouterProtocol)?
    let componentFactoryView: ComponentFactoryViewProtocol
    
    init(componentFactoryView: ComponentFactoryViewProtocol = ComponentFactoryView()){
        self.componentFactoryView = componentFactoryView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor?.getFeed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView(){
        navigationItem.title = "Super Hero App"
    }
}

extension HomeFeedViewController : HomeViewDisplayLogic {
   
    func displayHome(components: [ComponentsCoreViewModelType]) {
        for componentViewModel in components {
            if let view = componentFactoryView.createComponent(with: componentViewModel, and: router) {
                self.baseView?.containerStackView.addArrangedSubview(view)
            }
        }
    }
}
