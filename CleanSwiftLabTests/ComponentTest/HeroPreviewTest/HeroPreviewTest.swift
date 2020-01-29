//
//  HeroPreviewTest.swift
//  CleanSwiftLabTests
//
//  Created by Juan Andres Vasquez Ferrer on 1/13/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import CleanSwiftLab

class HeroPreviewTest: QuickSpec {
    
    let configurator = HeroPreviewConfigurator<HeroPreviewViewModel>(
        imageName: \.imageName,
        content: \.content,
        title: \.title
    )
    var containerView: UIContainerView!
    
    override func spec() {
        
        describe("Components") {
            
            beforeEach {
                self.containerView = UIContainerView(frame: TestUtils.getWindow().bounds)
            }
            
            describe("HeroPreviewView"){
                
                it("display normal hero preview"){
                   let viewModel = HeroPreviewViewModel(id: "spiderman", imageName: "SpidermanPreview", content: "contenido", title: "Mi title")
                    let handlerAction = PreviewHandlerAction(viewModel: viewModel, router: nil)
                    let heroPreviewView = HeroPreviewView(handlerActions: handlerAction)
                   self.configurator.configure(heroPreviewView, for: viewModel)
                   self.containerView.insertInContainer(heroPreviewView)
                   expect(self.containerView) == snapshot()
                }
                
                it("display  hero preview with large title"){
                   let viewModel = HeroPreviewViewModel(
                    id: "spiderman",
                    imageName: "SpidermanPreview",
                    content: "contenido",
                    title: TestUtils.generateLoremItSum(iteration: 20)
                    )
                   
                   let handlerAction = PreviewHandlerAction(viewModel: viewModel, router: nil)
                   let heroPreviewView = HeroPreviewView(handlerActions: handlerAction)
                   self.configurator.configure(heroPreviewView, for: viewModel)
                   self.containerView.insertInContainer(heroPreviewView)
                   expect(self.containerView) == snapshot()
                }
                
                it("display hero preview with large content"){
                   let viewModel = HeroPreviewViewModel(
                    id: "spiderman",
                    imageName: "SpidermanPreview",
                    content: TestUtils.generateLoremItSum(iteration: 20),
                    title: "Title"
                    )
                   
                   let handlerAction = PreviewHandlerAction(viewModel: viewModel, router: nil)
                   let heroPreviewView = HeroPreviewView(handlerActions: handlerAction)
                   self.configurator.configure(heroPreviewView, for: viewModel)
                   self.containerView.insertInContainer(heroPreviewView)
                   expect(self.containerView) == snapshot()
                }
                
                it("display hero preview without title"){
                   let viewModel = HeroPreviewViewModel(
                    id: "spiderman",
                    imageName: "SpidermanPreview",
                    content: TestUtils.generateLoremItSum(iteration: 20),
                    title: nil
                    )
                   
                   let handlerAction = PreviewHandlerAction(viewModel: viewModel, router: nil)
                   let heroPreviewView = HeroPreviewView(handlerActions: handlerAction)
                   self.configurator.configure(heroPreviewView, for: viewModel)
                   self.containerView.insertInContainer(heroPreviewView)
                   expect(self.containerView) == snapshot()
                }
                
                it("display hero preview without content"){
                   let viewModel = HeroPreviewViewModel(
                    id: "spiderman",
                    imageName: "SpidermanPreview",
                    content: nil,
                    title: "Title"
                    )
                   
                   let handlerAction = PreviewHandlerAction(viewModel: viewModel, router: nil)
                   let heroPreviewView = HeroPreviewView(handlerActions: handlerAction)
                   self.configurator.configure(heroPreviewView, for: viewModel)
                   self.containerView.insertInContainer(heroPreviewView)
                   expect(self.containerView) == snapshot()
                }
                
                it("display hero preview without image"){
                   let viewModel = HeroPreviewViewModel(
                    id: "spiderman",
                    imageName: nil,
                    content: TestUtils.generateLoremItSum(iteration: 20),
                    title: "Title"
                    )
                   
                   let handlerAction = PreviewHandlerAction(viewModel: viewModel, router: nil)
                   let heroPreviewView = HeroPreviewView(handlerActions: handlerAction)
                   self.configurator.configure(heroPreviewView, for: viewModel)
                   self.containerView.insertInContainer(heroPreviewView)
                   expect(self.containerView) == recordSnapshot()
                }
                
            }
        }
    }
}
