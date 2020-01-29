//
//  TestUtils.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 12/17/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class TestUtils {
    
    class func getWindow() -> UIWindow {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
        window.makeKeyAndVisible()
        return window
    }
    
    class func createContainerView() -> UIStackView {
        let containerView = UIStackView(frame: self.getWindow().bounds)
        containerView.distribution = .fill
        containerView.alignment = .fill
        containerView.axis = .vertical
        containerView.backgroundColor = .red
        return containerView
    }
    
    class func generateLoremItSum(iteration: Int) -> String {
        
        let lorem = "Lorem it sum lorem"
        var result = ""
        for i in 0...iteration {
            result += lorem
        }
        return result
    }
}
