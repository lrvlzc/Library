//
//  LibraryList.swift
//  Library
//
//  Created by Leo V on 19/03/24.
//

import SwiftUI

struct LibraryList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable{
        case all = "Todo"
        case ficcion = "Ficción"
        case infantil = "Infantil"
        case historia = "Historia"
        case futurologia = "Futurología"
        
        var id: FilterCategory {self}
    }
    
    var filteredLibrary: [Library] {
        modelData.libraries.filter { library in (!showFavoritesOnly || library.isFavorite) && (filter == .all || filter.rawValue == library.categoria.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Libreria" : filter.rawValue
        return showFavoritesOnly ? "Favoritos \(title)" : title
    }
    
    
    var body: some View {
        NavigationSplitView{
            List {
                ForEach(filteredLibrary) { library in NavigationLink {
                    LibraryDetail(library: library)
                }label: {
                    LibraryRow(library: library)
                }
                    
            }
            }
            .animation(.default, value: filteredLibrary)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar{
                ToolbarItem{
                    Menu {
                        Picker("Categoria", selection: $filter) {
                            ForEach(FilterCategory.allCases) { categoria in
                                Text(categoria.rawValue).tag(categoria)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favoritos", systemImage: "star.fill")
                        }

                        
                        
                    } label: {
                        Label("Filtro", systemImage: "ellipsis.circle")
                    }
                }
            }
            
        } detail: {
            Text("Elige un libro")
        }
    }
}

#Preview {
    LibraryList()
        .environment(ModelData())
}
