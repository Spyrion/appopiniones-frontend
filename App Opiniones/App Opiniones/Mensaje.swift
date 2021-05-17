//
//  Mensaje.swift
//  App Opiniones
//
//  Created by user181456 on 5/11/21.
//

import Foundation

class Mensaje : Mappable {
    var id : Int?
    var body : String?
    var usuario : User?
    var tema : Tema?
    
    private enum CodingKeys : String , CodingKey {
        
        case id = "id"
        case body = "body"
        case usuario = "usuario"
        case tema = "tema"
        
    }
    
}
