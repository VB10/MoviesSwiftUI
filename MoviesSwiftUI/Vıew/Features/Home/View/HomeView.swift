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
        return ActivityIndicatorAnimate().frame(height: 100, alignment: .center).foregroundColor(.orange)
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
//
//        return GridStack(minCellWidth: 150, spacing: 1, numItems: viewModel.movieItems.count) { index,cellWidth in
//            self.movieCard(item: self.viewModel.movieItems[index]).onAppear {
//                print(index)
//            }


        //}
//        return List {
//            ForEach(viewModel.movieItems.chunks(size: 2), id: \.self) {
//                chunk in ForEach(chunk, id: \.self) {
//                    item in self.movieCard(item: item)
//                }
//            }
////            if (true) {
////                Text("aa2")
////            }
//        }
        return List(viewModel.movieItems.chunks(size: 2), id: \.self) {
            chunk in ForEach(chunk, id: \.self) {
                item in self.movieCard(item: item).onAppear {
                    if self.viewModel.movieItems.last == item {
                        self.viewModel.onLazyLoading()
                    }
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
