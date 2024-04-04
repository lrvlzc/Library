//
//  Library.swift
//  Library
//
//  Created by Leo V on 16/03/24.
//

import Foundation
import SwiftUI

 struct Library: Hashable, Codable, Identifiable{
     var id: Int
     var isbn: String
     var titulo: String
     var autor: String
     var editorial: String
     var idioma: String
     var descripcion: String
     
     //var categoria: String
     var isFeatured: Bool
     var isFavorite: Bool
 
     private var portada: String
     var image: Image{
            Image(portada)
     }
     
     var featureImage: Image? {
         isFeatured ? Image(portada + "-featured") : nil
     }
 
      var categoria: Category
      enum Category: String, CaseIterable, Codable{
        case ficcion = "Ficción"
        case infantil = "Infantil"
        case historia = "Historia"
        case futurologia = "Futurología"
      }
 }
 
