//
//  PortadaImage.swift
//  Library
//
//  Created by Leo V on 19/03/24.
//

import SwiftUI

struct PortadaImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    PortadaImage(image: Image("cienaños"))
}
