//
//  CategoryRow.swift
//  Library
//
//  Created by Leo V on 19/03/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Library]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { library in
                        NavigationLink {
                            LibraryDetail(library: library)
                        } label: {
                            CategoryItem(library: library)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let libraries = ModelData().libraries
    return CategoryRow(
        categoryName: libraries[0].categoria.rawValue, items: Array(libraries.prefix(4)))
}
