//
//  CarruselView.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol CarruselViewDelegate: class {
    func carruselView(_ carruselView: CarruselView,
                      selected item: CarruselItemViewModel)
}

class CarruselView: BaseView {
    
    //MARK: - UIVars
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        let lightGray = UIColor.blue
        let finishGradient = lightGray.withAlphaComponent(0)
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        gradient.colors = [lightGray.cgColor, finishGradient.cgColor]
        view.layer.addSublayer(gradient)
        self.gradient = gradient
        return view
    }()
    
    var gradient:CAGradientLayer?
    
    //MARK: - Vars
    let reuseIdentifier = String(describing: CarruselCell.self)
    let viewModel: CarruselViewModel
    weak var delegate: CarruselViewDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientView.frame = bounds
        gradient?.frame = bounds
    }
    
    init(frame: CGRect = .zero, viewModel: CarruselViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView(){
        insertSubview(gradientView, at: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupCell(){
        let nib = UINib(nibName:reuseIdentifier , bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func applyGradientWith(from: UIColor, to: UIColor){
        
    }
}

//MARK: - Implement CollectionView dataSource and delegate

extension CarruselView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CarruselCell else {
            fatalError()
        }
        
        cell.imageView.image = UIImage(named: viewModel.items[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.item]
        delegate?.carruselView(self, selected: item)
    }
}
