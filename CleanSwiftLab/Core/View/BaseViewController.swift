//
//  BaseViewController.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController <T: UIView>: UIViewController {
    
    var baseView: T? {
        get{
            return view as? T
        }
    }

    override func loadView() {
        self.view = T()
    }
}
