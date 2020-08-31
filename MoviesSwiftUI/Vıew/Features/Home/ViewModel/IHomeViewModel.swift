//
//  IHomeViewModel.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


protocol IHomeViewModel {
    var movieService: IMovieService { get set }
    var listCurrentCount: Int { get set }
    var searchText: String { get set }
    var isLoading: Bool { get set }
    func changeLoading()
    func onLazyLoading()
    func getSearchItem(term: String)
    func getAllItems(pageIndex: Int)

    func searchTextOnChange()

}
