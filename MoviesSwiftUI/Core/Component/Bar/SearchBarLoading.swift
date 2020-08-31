//
//  SearchBarLoading.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI

struct SearchBarLoading: View {
    @Binding var text: String
    var title: String
    @Binding var isLoading: Bool

    var body: some View {
        HStack {
            if self.isLoading {
                ActivityIndicator(isAnimating: isLoading)
            }
            SearchBar(input: $text, title: title)
        }
    }
}

struct SearchBarLoading_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarLoading(text: .constant(""), title: "veli", isLoading: .constant(false))
    }
}
