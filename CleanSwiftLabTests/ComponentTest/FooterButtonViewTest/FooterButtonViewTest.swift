//
//  FooterButtonViewTest.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 12/18/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import CleanSwiftLab

class FooterButtonViewTest: QuickSpec {
    
    let configurator = FooterButtonConfigurator<ButtonFooterViewModel>(
        buttonsKeyPath: \.buttons
    )
    var footerButtonView: ButtonFooterView!
    var containerView: UIContainerView!
    
    override func spec() {
        
        describe("Components") {
            
            beforeEach {
                self.containerView = UIContainerView(frame: TestUtils.getWindow().bounds)
                self.footerButtonView = ButtonFooterView()
            }
            
            describe("footer button view"){
                
                it("display with only button"){
                   let viewModel = self.createButtons(buttonsText: ["Button test"])
                   self.configurator.configure(self.footerButtonView, for: viewModel)
                   self.containerView.insertInContainer(self.footerButtonView)
                   expect(self.containerView) == snapshot()
                }
                
                it("display with only button with container"){
                    let viewModel = self.createButtons(buttonsText: ["Button test"])
                    self.configurator.configure(self.footerButtonView, for: viewModel)
                    self.containerView.insertInContainer(self.footerButtonView)
                    expect(self.containerView) == snapshot()
                }
                
                it("display with two buttons"){
                    let viewModel = self.createButtons(buttonsText: ["Button test", "Button test 2"])
                    self.configurator.configure(self.footerButtonView, for: viewModel)
                    self.containerView.insertInContainer(self.footerButtonView)
                    expect(self.containerView) == snapshot()
                }
                
                it("display with N buttons"){
                    let viewModel = self.createButtons(buttonsText: ["Button test", "Button test 2","Button test3", "Button test 4","Button test5", "Button test6","Button test 7", "Button test 8","Button test 9", "Button test N"])
                    self.configurator.configure(self.footerButtonView, for: viewModel)
                    self.containerView.insertInContainer(self.footerButtonView)
                    expect(self.containerView) == snapshot()
                }
                
                it("display with button with multiple lines"){
                    let viewModel = self.createButtons(buttonsText: [
                        "Button line 1 \nButton line 2 \nButton line 3 \nButton line 4 \nButton line 5 \nButton line 6 \nButton line 7"]
                    )
                    self.configurator.configure(self.footerButtonView, for: viewModel)
                    self.containerView.insertInContainer(self.footerButtonView)
                    expect(self.containerView) == snapshot()
                }
            }
        }
    }
    
    private func createButtons(buttonsText: [String]) -> ButtonFooterViewModel {
        var buttonsViewModel: [ButtonViewModel] = []
        for buttonText in buttonsText {
            buttonsViewModel.append(ButtonViewModel(text: buttonText))
        }
        return ButtonFooterViewModel.init(buttons: buttonsViewModel)
    }
}
