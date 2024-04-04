//
//  ContentView.swift
//  Library
//
//  Created by Leo V on 26/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }.tag(Tab.featured)
            LibraryList()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }.tag(Tab.list)
        }
    }
}

#Preview {
    ContentView().environment(ModelData())

}
