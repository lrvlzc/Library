//
//  LibraryRow.swift
//  Library
//
//  Created by Leo V on 19/03/24.
//

import SwiftUI

struct LibraryRow: View {
    var library: Library
    
    var body: some View {
        HStack{
            library.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(library.titulo)
                    .bold()
                
                Text(library.autor)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
            
            if library.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let libraries = ModelData().libraries
    return Group {
        LibraryRow(library: libraries[0])
        LibraryRow(library: libraries[1])
    }
}
