//
//  ModelData.swift
//  Library
//
//  Created by Leo V on 16/03/24.
//

import Foundation

 @Observable
 class ModelData{
 var libraries: [Library] = load("libraryData.json")
     var profile = Profile.default
 
 var features: [Library] {
 libraries.filter { $0.isFeatured }
 }
     
     var categories: [String: [Library]]{
         Dictionary(
            grouping: libraries, by: {$0.categoria.rawValue}
         )
     }
 
 }
 
 func load<T: Decodable>(_ filename: String) -> T {
 let data: Data
 
 guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
 else {
 fatalError("Couldn't find \(filename) in main bundle.")
 }
 
 do {
 data = try Data(contentsOf: file)
 } catch {
 fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
 }
 
 do {
 let decoder = JSONDecoder()
 return try decoder.decode(T.self, from: data)
 } catch {
 fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
 }
 }
