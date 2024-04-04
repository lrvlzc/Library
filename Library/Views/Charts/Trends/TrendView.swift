//
//  TrendView.swift
//  Library
//
//  Created by Leo V on 28/03/24.
//

import SwiftUI
import Charts

struct TrendView: View {
    var data = [
        TrendGraph(categoria: "Ficción", numLibros: 5),
        TrendGraph(categoria: "Infantil", numLibros: 2),
        TrendGraph(categoria: "Historia", numLibros: 1),
        TrendGraph(categoria: "Futurologia", numLibros: 2),

    ]
    
    var body: some View {
        VStack{
            Text("Tendencias en tus lecturas")
                .font(.title3)

            
            Chart{
                ForEach(data) { d in
                    SectorMark(angle: .value("libros", d.numLibros),
                               //innerRadius: .fixed(40), //circulo central, da forma de dona
                               angularInset: 1) //lineas entre las categorias
                        .foregroundStyle(by: .value("Categoria", d.categoria))
                        .cornerRadius(5) //curvea las esquinas
                }
            }
        }
        .padding()
    }
}

#Preview {
    TrendView()
}
