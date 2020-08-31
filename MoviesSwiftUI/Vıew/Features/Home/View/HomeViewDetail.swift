//
//  HomeViewDetail.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HomeViewDetail: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero

    let movieModel: MovieModel
    var body: some View {
        VStack {
            KFImage(URL(string: getImagePath())).resizable().frame(alignment: .center).scaledToFit()
            Divider()
            nameAndReleaseData()
            startAvarage()
            Spacer()
        }.padding(10).navigationBarTitle(Text(movieModel.originalTitle ?? ""), displayMode: .inline).gesture(DragGesture().updating(self.$dragOffset, body: { (value, state, transaction) in
                self.leftToSwipe(value: value)
            }
            )
        )

    }

    func nameAndReleaseData() -> some View {
        return HStack {
            Text(movieModel.title ?? "").fontWeight(.bold).underline()
            Spacer()
            Text(movieModel.releaseDate ?? "")

        }
    }

    func startAvarage() -> some View {
        return HStack {
            Image(systemName: "star.fill").foregroundColor(.orange)
            Text("\(movieModel.voteCount ?? 0)").fontWeight(.light).fixedSize()
            Spacer()
        }
    }


    private func getImagePath() -> String {
        return ApplicationConstants.shared.imageNetorkPath + (movieModel.posterPath ?? "kqjL17yufvn9OVLyXYpvtyrFfak.jpg")
    }

    func leftToSwipe(value: DragGesture.Value) {
        if(value.startLocation.x < 20 && value.translation.width > 100) {
            self.mode.wrappedValue.dismiss()
        }
    }
}

struct HomeViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDetail(
            movieModel: MovieModel.init(popularity: 1, voteCount: 1, video: true, posterPath: "/pci1ArYW7oJ2eyTo2NMYEKHHiCP.jpg", id: 11, adult: true, backdropPath: "", originalLanguage: "tr", originalTitle: "Helo", genreIDS: [], title: "Hello", voteAverage: 15, overview: "", releaseDate: "15-15-14"))
    }
}
