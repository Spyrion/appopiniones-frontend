//
//  Connection.swift
//  App Opiniones
//
//  Created by user185160 on 5/4/21.
//

import Foundation

class Connection {
    
    let baseURLStringUsuarios = "localhost:8080/api/usuarios/"
    let baseURLStringMensajes = "localhost:8080/api/mensajes/"
    let baseURLStringTemas    = "localhost:8080/api/temas/"
    let BaseURLStringAuthenticate = "localhost:8080/api/authenticate"
    let token = ""
    
    
    //funcion para obtener los datos nuestros en los Ajustes
    
    
        
        
        
    //funcion para registro
    
    
        func register(withId id: Int, params: [AnyHashable: Any], completion: @escaping (_ user: User?) ->
        Void ) {
        guard let urlRegister = URL(string: baseURLStringUsuarios + "\(id)/") else {
            completion(nil)
            return
            
        }
            
        }
    
    
    
    
   //funcion para login
    
    
            
            
   // funcion para postear mensajes
    
    
}
    

