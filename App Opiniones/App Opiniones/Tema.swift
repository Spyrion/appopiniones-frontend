//
//  Tema.swift
//  App Opiniones
//
//  Created by user181456 on 5/11/21.
//

import Foundation

class Tema : Mappable {
    var id : Int?
    var title : String?
    var description : String?
    var category : String?
    var photo : String?
    var usuario : User?
    var mensaje : Mensaje?
    
    private enum CodingKeys : String , CodingKey {
        
        case id = "id"
        case title = "title"
        case description = "description"
        case category = "category"
        case photo = "photo"
        case usuario = "usuario"
        case mensaje = "mensaje"
    }
    }
    

