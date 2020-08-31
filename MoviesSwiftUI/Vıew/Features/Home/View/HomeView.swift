//
//  HomeView.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI
import GridStack

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    @ViewBuilder
    var body: some View {
        bodyView()
    }

    func bodyView() -> some View {
        return ZStack {
            if self.viewModel.movieItems.isEmpty {
                loadingView()
            } else {
                homeBodyView()
            }
        }
    }

    func loadingView() -> some View {
        return GeometryReader {
            geometry in
            ActivityIndicatorAnimate().frame(height: geometry.size.height * 0.2, alignment: .center).foregroundColor(.orange)
        }
    }

    func homeBodyView() -> some View {
        return VStack {
            searchView()
            movieListView()
        }
    }
    func searchView() -> some View {
        return VStack {
            SearchBarLoading(text: $viewModel.searchText, title: "Search Key", isLoading: $viewModel.isLoading)
        }
    }

    func movieListView() -> some View {
        return List(viewModel.movieItems.chunks(size: 2), id: \.self) {
            chunk in ForEach(chunk, id: \.self) {
                item in self.movieCard(item: item)
                    .onAppear {
                        self.viewModel.onAppear(model: item)
                }
            }
        }

    }

    func movieCard(item: MovieModel) -> some View {
        return MovieCard(title: item.title, date: item.releaseDate, image: item.posterPath)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
