//
//  MovieCard.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieCard: View {
    let title: String?
    let date: String?
    let image: String?

    private func getImagePath() -> String {
        return ApplicationConstants.shared.imageNetorkPath + (image ?? "kqjL17yufvn9OVLyXYpvtyrFfak.jpg")
    }

    private func getDate() -> String {
        return date ?? "Empty"
    }

    private func getTitle() -> String {
        return title ?? "Empty"
    }


    var body: some View {
        VStack(spacing: 10) {
            KFImage(URL(string: getImagePath())).resizable().scaledToFit()
            Text(getTitle())
            Text(getDate()).fontWeight(.thin).font(.subheadline)
        }
            .padding(5)
            .shadow(radius: 15)
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: 150)
            .border(Color(.systemGray6), width: 3)
    }
}

struct ItunesCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(title: "Francis Ford Coppola", date: "2020-07-03T07:00:00Z", image: "/pci1ArYW7oJ2eyTo2NMYEKHHiCP.jpg").previewLayout(.sizeThatFits)
    }
}
