//
//  HomeViewModel.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject, IHomeViewModel {

    @Published var movieItems: [MovieModel] = []
    @Published var isLoading: Bool = false


    @Published var searchText: String = "" {
        didSet {
            searchTextOnChange()
        }
    }

    var twiceCount: Int = 1


    var listCurrentCount: Int
    var searchListCurrentCount: Int
    var movieService: IMovieService
    var timer: TimerManager

    init() {
        movieService = MovieService()
        timer = TimerManager()
        listCurrentCount = 1
        searchListCurrentCount = 1
        getAllItems(pageIndex: listCurrentCount)
    }

    func changeLoading() {
        isLoading = !isLoading
    }

    func onLazyLoading() {
        listCurrentCount += 1
        if !searchText.isEmpty {
            resetNormalList()
            searchListCurrentCount += 1
            getSearchItem(term: searchText, pageIndex: listCurrentCount)
        } else {
            listCurrentCount += 1
            resetSearchList()
            getAllItems(pageIndex: listCurrentCount)

        }
    }

    private func resetSearchList() {
        if searchListCurrentCount > 1 {
            searchListCurrentCount = 1
        }
    }
    private func resetNormalList() {
        if listCurrentCount > 1 {
            listCurrentCount = 1
        }
    }

    func onAppear(model: MovieModel) {
        if movieItems.last == model {
            onLazyLoading()
        }
    }


    func getAllItems(pageIndex: Int) {

        movieService.getAllItems(pageIndex: pageIndex, onSuccess: { (items) in
            if self.movieItems.isEmpty {
                self.movieItems = items
            } else {
                self.movieItems = self.movieItems + items
            }
        }) { (error) in
            print(error.debugMessage ?? "")
        }

    }
    func getSearchItem(term searchText: String, pageIndex: Int) {
        changeLoading()
        movieService.getAllTermItems(pageIndex: pageIndex, term: searchText, onSuccess: { (movies) in
            self.movieItems = movies
            self.changeLoading()
        }) { (error) in
            self.changeLoading()
            print(error)
        }


    }

    func searchTextOnChange() {
        if searchText.isEmpty {
            resetList()
        } else {
            if searchText.count > StringRegex.maxValue.rawValue {
                timer.start {
                    self.getSearchItem(term: self.searchText, pageIndex: self.searchListCurrentCount)
                }
            } else {
                // TODO: - Empty State
            }
        }

    }

    private func resetList() {
        movieItems.removeAll()
        resetNormalList()
        getAllItems(pageIndex: listCurrentCount)
    }

}

