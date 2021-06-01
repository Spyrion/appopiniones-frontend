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
    let baseUrlStringTemas = "localhost:8080/api/temas/"
    
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
    
    func getTema(withId id: Int  , completion: @escaping (_ tema: Tema?) -> Void) {
    guard let url = URL(string: baseUrlStringTemas + "\(id)/") else {
       completion(nil)
       return
       
   }
       
       let urlSessionTema = URLSession(configuration: URLSessionConfiguration.default)

       let task = urlSessionTema.dataTask(with: url) {
           data, response, error in

           if error == nil {
                let tema = Tema(withJsonData: data)
                completion(tema)
             } else {
             completion(nil)

             }
       }
       task.resume()
       }
    
    func getUsuarios(completion: @escaping (_ user: UserList?) -> Void) {
    guard let url = URL(string: baseURLStringUsuarios) else {
       completion(nil)
       return
       
   }
       
       let urlSessionUser = URLSession(configuration: URLSessionConfiguration.default)

       let task = urlSessionUser.dataTask(with: url) {
           data, response, error in

           if error == nil {
                let user = UserList(withJsonData: data)
                completion(user)
             } else {
             completion(nil)

             }
       }
       task.resume()
       }
    
}
