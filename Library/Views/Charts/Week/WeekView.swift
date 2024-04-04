//
//  WeekView.swift
//  Library
//
//  Created by Leo V on 28/03/24.
//

import SwiftUI
import Charts

struct WeekView: View {
    var data = [
        WeekGraph(dia: "Lunes", minutosLectura: 30),
        WeekGraph(dia: "Martes", minutosLectura: 20),
        WeekGraph(dia: "Miercoles", minutosLectura: 23),
        WeekGraph(dia: "Jueves", minutosLectura: 10),
        WeekGraph(dia: "Viernes", minutosLectura: 27),
        WeekGraph(dia: "Sabado", minutosLectura: 45),
        WeekGraph(dia: "Domingo", minutosLectura: 52)
    ]

    var body: some View {
        VStack{
            Text("Minutos de lectura durante la última semana")
                .font(.title3)

            
            Chart{
                ForEach(data) { d in
                    BarMark(x: PlottableValue.value("dia", d.dia), y: .value("tiempo",d.minutosLectura))
                        .annotation {
                            Text(String(d.minutosLectura))
                        }
                }
                RuleMark(
                    y:.value("Pomedio", 29.9)
                ).foregroundStyle(.red)
            }
            .chartYScale(range: .plotDimension(padding: 10))
        }
        .padding()
    }
}

#Preview {
    WeekView()
}
