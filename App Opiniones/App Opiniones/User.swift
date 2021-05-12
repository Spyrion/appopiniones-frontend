//
//  User.swift
//  App Opiniones
//
//  Created by user185160 on 5/4/21.
//

import Foundation

class User :  Mappable{
    
    var id: Int?
    var username :String?
    var password :String?
    var messages : Int?
    var photo : String?
    var tema : Tema?
    var mensaje :  Mensaje?
    
    private enum CodingKeys : String , CodingKey {
        
        case id = "id"
        case username = "username"
        case password = "password"
        case messages = "messages"
        case photo = "photo"
        case tema = "tema"
        case mensaje = "mensaje"
    }
}
