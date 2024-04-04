//
//  PageView.swift
//  Library
//
//  Created by Leo V on 22/03/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
                .aspectRatio(3/2, contentMode: .fit)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                   .frame(width: CGFloat(pages.count * 18))
                   .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map {
        FeatureCard(library: $0)
    })
}
