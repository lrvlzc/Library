//
//  CategoryItem.swift
//  Library
//
//  Created by Leo V on 19/03/24.
//

import SwiftUI

struct CategoryItem: View {
    var library: Library
    
    var body: some View {
        VStack(alignment: .leading){
            library.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 135, height: 155)
                .cornerRadius(5)
            Text(library.titulo)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading,15)
    }
}

#Preview {
    CategoryItem(library: ModelData().libraries[0])
}
