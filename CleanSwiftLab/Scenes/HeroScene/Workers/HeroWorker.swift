//
//  HeroWorker.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol HeroWorkerProtocol: class {
    func getHero(_ heroId: String, completion:@escaping(Results<HeroEntity>) -> Void)
}

class HeroWorker: HeroWorkerProtocol {
   
    func getHero(_ heroId: String, completion: @escaping (Results<HeroEntity>) -> Void) {
        
        let spidermanHeroStringJson = """
             {"id":"spiderman",
              "realName": "Peter Parker",
              "heroName": "Spiderman",
              "firstComicYear": 1940,
                "backgroundHeroHexColor": "#4d80e4ff",
               "fullImageName": "spidermanChibi",
               "description": "Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.Spider-Man (llamado Hombre Araña en muchas de las traducciones al español) es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko."
                }
        """
        
        let harleyHeroStringJson = """
             {"id":"harley",
              "realName": "Harleen Frances Quinzel",
              "heroName": "Harley Quinn",
              "firstComicYear": 1960,
               "fullImageName": "harleyChibi",
                "backgroundHeroHexColor": "#36424dff",
               "description": "Harley Quinn es un personaje ficticio que aparece en cómics estadounidenses de la editorial DC Comics comúnmente como un adversario del superhéroe Batman."}
        """
        
        let batmanHeroStringJson = """
             {"id":"batman",
              "realName": "Bruce Wayne",
              "heroName": "Batman",
              "firstComicYear": 1930,
               "fullImageName": "batmanChibi",
                "backgroundHeroHexColor": "#000011ff",
               "description": "La identidad secreta de Batman es Bruce Wayne (Bruno Díaz en algunos países de habla hispana),6​7​8​ un millonario magnate empresarial y filántropo dueño de Empresas Wayne en Gotham City. Después de presenciar el asesinato de sus padres, el Dr. Thomas Wayne y Martha Wayne en un violento y fallido asalto cuando era niño, juró venganza contra los criminales, un juramento moderado por el sentido de la justicia. Bruce Wayne se entrena física e intelectualmente y crea un traje inspirado en los murciélagos para combatir el crimen, con sus gadgets de combate del batcinturón y sus vehículos.9​"}
        """
        
        let heroMap: [String: String] = [
            "spiderman": spidermanHeroStringJson,
            "harley": harleyHeroStringJson,
            "batman":batmanHeroStringJson
        ]
        
       
        guard  let filterJson = heroMap[heroId],
            let data = filterJson.data(using: .utf8) else{
                let heroError = HeroError()
                completion(.error(error:heroError))
            return
        }
        
        let decoder = JSONDecoder()
        
        do{
            let entity = try decoder.decode(HeroEntity.self, from: data)
            completion(.success(response: entity))
        }catch(let error){
            completion(.error(error:error))
        }
    }
}

//FIX: REMOVER ESTA CLASE DE ACA

class HeroError: Error{
    
}
