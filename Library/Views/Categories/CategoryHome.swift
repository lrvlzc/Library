//
//  CategoryHome.swift
//  Library
//
//  Created by Leo V on 20/03/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    @State private var searchTerm = ""

    
    var body: some View {
        NavigationSplitView{
            List{
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Inicio")
            .searchable(text: $searchTerm, prompt: "Buscar")
            .toolbar{
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("Perfil", systemImage: "person.crop.circle.fill")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Elige un libro")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
