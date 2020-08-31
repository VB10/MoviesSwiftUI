//
//  SearchBar.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @State var output: String = ""
    @Binding var input: String
    var title: String


    var body: some View {
        TextField(title, text: $input,
            onCommit: {
                self.output = self.input
            })
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)

    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(
            input: .constant(""), title: "vb").previewLayout(.sizeThatFits)
    }
}
