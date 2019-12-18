//
//  HomeFeedWorker.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol HomeFeedWorkerProtocol : class {
    func getHomeFeed(completion:@escaping(Results<[HomeFeedEntity]>) -> Void)
}


class FakeHomeFeedWorker: HomeFeedWorkerProtocol {
    func getHomeFeed(completion: @escaping (Results<[HomeFeedEntity]>) -> Void) {
        
        let carruselStringJson = """
        {"items":[{"imageName":"AdvengersEndGame","id":"marvel"},{"imageName":"DCJusticeLeague","id":"dc"}]}
        """
        
        let titleStringJson = """
         {"content":"Famous heroes", "fontSize":18}
        """
        
        let spidermanPreviewStringJson = """
             {"id":"spiderman","imageName":"SpidermanPreview", "title":"Spiderman", "content": "Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko."}
        """
        
        let harleyQueenPreviewStringJson = """
             {"id":"harley","imageName":"harley", "title":"Harley Quinn", "content": "Harley Quinn es un personaje ficticio que aparece en cómics estadounidenses de la editorial DC Comics comúnmente como un adversario del superhéroe Batman."}
        """
        
        let batmanPreviewStringJson = """
             {"id":"batman","imageName":"batman", "title":"Batman", "content": "Batman (conocido inicialmente como The Bat-Man y en español como el Hombre Murciélago) es un personaje creado por los estadounidenses Bob Kane y Bill Finger,5​ y propiedad de DC Comics. Apareció por primera vez en la historia titulada «El caso del sindicato químico» de la revista Detective Comics N.º 27, lanzada por la editorial National Publications el 30 de marzo de 1939."}
        """
        
        let footerButtonStringJson = """
            {"buttons":[{"text":"Enviar regalo"},{"text":"Enviar Comparte"}]}
        """
        

        let feedEntity = HomeFeedEntity(type: "carrusel", data: carruselStringJson)
        let titleEntity = HomeFeedEntity(type: "title", data: titleStringJson)
        let spiderManPreviewEntity =  HomeFeedEntity(type: "heroPreview", data: spidermanPreviewStringJson)
        let batmanPreviewEntity = HomeFeedEntity(type: "heroPreview", data: batmanPreviewStringJson)
        let harleyQuiinPreviewEntity =  HomeFeedEntity(type: "heroPreview", data: harleyQueenPreviewStringJson)
        let buttonsEntity =  HomeFeedEntity(type: "footerButton", data: footerButtonStringJson)

        completion(.success(response:[
            feedEntity,
            titleEntity,
            spiderManPreviewEntity,
            harleyQuiinPreviewEntity,
            batmanPreviewEntity,
            buttonsEntity]
            )
        )
    }
}
