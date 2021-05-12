//
//  Connection.swift
//  App Opiniones
//
//  Created by user185160 on 5/10/21.
//

import Foundation

class Connection : Mappable {
    // funcion get para ajustes
    let baseURLStringUsuarios = "localhost:8080/api/usuarios/"
    
    func getDataAjustes(withId id: Int  , completion: @escaping (_ user: User?) -> Void) {
    guard let urlDataAjustes = URL(string: baseURLStringUsuarios + "\(id)/") else {
       completion(nil)
       return
       
   }
       
       let urlSessionDataAjustes = URLSession(configuration: URLSessionConfiguration.default)

       let task = urlSessionDataAjustes.dataTask(with: urlDataAjustes) {
           data, response, error in

           if error == nil {
                let user = User(withJsonData: data)
                completion(user)
             } else {
             completion(nil)

             }
       }
       task.resume()
       }
    
}
