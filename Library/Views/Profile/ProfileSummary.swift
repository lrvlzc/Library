//
//  ProfileSummary.swift
//  Library
//
//  Created by Leo V on 22/03/24.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notificaciones: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Fotos Estacionales: \(profile.seasonalPhoto.rawValue)")
                Text("Fecha Objetivo: ") + Text (profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Tendencias")
                        .font(.headline)
                    
                    //Aquí se debe poner las estadisticas del tiempo de lectura
                    
                    Text("Tendencias")
                        .font(.title2)
                        .bold()
                    WeekView()
                    Divider()
                    TrendView()
                    Divider()
                    IdiomView()
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
}
