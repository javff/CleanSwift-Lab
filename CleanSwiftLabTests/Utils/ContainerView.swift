//
//  ContainerView.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 1/13/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class UIContainerView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let containerView = UIStackView()
       containerView.distribution = .fill
       containerView.alignment = .fill
       containerView.axis = .vertical
       return containerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    public func insertInContainer(_ view: UIView) {
        self.stackView.addArrangedSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    
    private func setupConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        self.stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}
