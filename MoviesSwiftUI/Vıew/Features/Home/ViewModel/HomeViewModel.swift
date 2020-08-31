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
    
    var twiceCount : Int = 2
    

    var listCurrentCount: Int
    var movieService: IMovieService

    init() {
        movieService = MovieService()
        listCurrentCount = 1
        getAllItems(pageIndex: listCurrentCount)
    }

    func changeLoading() {
        isLoading = !isLoading
    }

    func onLazyLoading() {
        twiceCount -= 1
        if twiceCount < 0 {
            getAllItems(pageIndex: 2)
        }
    }

    func getAllItems(pageIndex: Int) {
        movieService.getAllItems(pageIndex: pageIndex, onSuccess: { (items) in
           
            if self.movieItems.isEmpty {
                self.movieItems = items
            }else{
                self.movieItems = self.movieItems + items
            }
        }) { (error) in
            print(error.debugMessage)
        }

    }
    func getSearchItem(term searchText: String) {
        changeLoading()

        changeLoading()

    }

    func searchTextOnChange() {

    }

}
