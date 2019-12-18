//
//  HomeSceneTest.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 12/13/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import CleanSwiftLab


class HomeSceneSpec: QuickSpec {
    
    var window: UIWindow!
    
    override func spec() {
        
        describe("Home feed") {
            
            beforeEach {
                self.window = TestUtils.getWindow()
            }
            
            describe("render component"){
               
                it("show carrusel component"){
                    let homeFeedViewController = HomeFeedCreator().configure()
                    homeFeedViewController.view.backgroundColor = .blue
                    self.window.rootViewController = homeFeedViewController
                    expect(self.window.rootViewController?.view) == snapshot()
                }
            }
        }
    }
    
}
