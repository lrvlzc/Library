//
//  FeatureCard.swift
//  Library
//
//  Created by Leo V on 22/03/24.
//

import SwiftUI

struct FeatureCard: View {
    var library: Library
    
    var body: some View {
        library.featureImage?
            .resizable()
            .overlay {
                TextOverLay(library: library)
            }
    }
}

struct TextOverLay: View {
    var library: Library
    
    var gradient: LinearGradient {
        .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
                        startPoint: .bottom,
                        endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading){
                Text(library.titulo)
                    .font(.title)
                    .bold()
                Text(library.autor)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(library: ModelData().features[0])
        .aspectRatio(3/2, contentMode: .fit)
}
