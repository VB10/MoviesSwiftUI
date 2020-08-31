//
//  HomeView.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI
import GridStack
import WaterfallGrid
struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    @ViewBuilder
    var body: some View {
        NavigationView {
            bodyView()
        }
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
        return VStack(spacing: 20) {
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
        return GeometryReader {
            geometry in GridStack(minCellWidth: geometry.size.width / 3, spacing: 10, numItems: self.viewModel.movieItems.count) { index, cellWidth in
                self.movieCard(item: self.viewModel.movieItems[index])
            }
        }
    }

    func movieCard(item: MovieModel) -> some View {
        return NavigationLink(destination: HomeViewDetail(movieModel: item)) {
            MovieCard(title: item.title, date: item.releaseDate, image: item.posterPath).onAppear {
                self.viewModel.onAppear(model: item)
            }
        }.buttonStyle(PlainButtonStyle())
            .navigationBarTitle("Movies")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
