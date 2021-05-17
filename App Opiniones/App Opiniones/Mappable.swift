//
//  Mappable.swift
//  App Opiniones
//
//  Created by user185160 on 5/4/21.
//

import Foundation

protocol Mappable : Codable {
    init? (withJsonData: Data?)
}

extension Mappable {
    init?(withJsonData: Data?){
    guard let data = withJsonData else { return nil }
    do {
     self = try JSONDecoder().decode(Self.self, from: data)
         } catch {
              return nil
             }
        }
}
