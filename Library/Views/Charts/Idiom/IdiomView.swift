//
//  Idiomview.swift
//  Library
//
//  Created by Leo V on 28/03/24.
//

import SwiftUI
import Charts

struct IdiomView: View {
    
    var data = [
        IdiomGraph(idioma: "Inglés", numLibros: 2),
        IdiomGraph(idioma: "Español", numLibros: 6),
        IdiomGraph(idioma: "Francés", numLibros: 3),

    ]
    var body: some View {
        VStack{
            Text("Idiomas más leídos")
                .font(.title3)
            
            Chart(data){
                
                BarMark(
                    x:.value("Libros", $0.numLibros)
                )
                .foregroundStyle(by: .value("idioma", $0.idioma))
            }
        }
        .padding()
    }
}

#Preview {
    IdiomView()
}
