//
//  LibraryDetail.swift
//  Library
//
//  Created by Leo V on 16/03/24.
//

import SwiftUI

struct LibraryDetail: View {
    @Environment(ModelData.self) var modelData
    var library: Library
    
    var libraryIndex: Int{
        modelData.libraries.firstIndex(where: {$0.id == library.id})!
    }
    
    var body: some View {
       @Bindable var modelData = modelData
        
        ScrollView{
            PortadaImage(image: library.image)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            
            VStack(alignment: .leading){
                HStack{
                    Text(library.titulo)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.libraries[libraryIndex].isFavorite)
                }
                
                HStack {
                    Text(library.autor)
                    Spacer()
                    Text(library.idioma)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Acerca de: \(library.titulo)")
                    .font(.title3)
                Text(library.descripcion)
                
            }
            .padding()

        }
        .navigationTitle(library.titulo)
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem{
                Menu {
                    Button{
                    }label: {
                        Label("Compartir", systemImage: "square.and.arrow.up")
                    }
                    
                    Button{
                    }label: {
                        Label("Más sugerencias así", systemImage: "checkmark.circle.fill")
                    }
                    
                    Button{
                    }label: {
                        Label("Menos sugerencias así", systemImage: "nosign")
                    }
                    
                } label: {
                    Label("Más", systemImage: "ellipsis.circle")
                }
            }
        }
        
        .overlay(alignment: .bottom){
            VStack{
                HStack{
                    Button{
                        
                    } label: {
                        Text("Leer")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 30)
            }.background()
        }
        
    }
}


#Preview {
    let modelData = ModelData()
    return LibraryDetail(library: modelData.libraries[0])
        .environment(modelData)
}
