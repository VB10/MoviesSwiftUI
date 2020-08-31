//
//  MovieService.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


class MovieService: IMovieService {

    private let manager: INetworkManager

    init() {
        manager = NetworkManager()
    }

    func getAllItems(pageIndex: Int, onSuccess: @escaping ([MovieModel]) -> Void, onError: @escaping (BaseError) -> Void) {

        manager.get(path: .movieTopRated, paramaters: queryParamatersPage(page: pageIndex), onSuccess: { (response: BaseResponse<TheMovieBaseModel>) in
                guard let items = response.model?.results else {
                    fatalError(response.message ?? "Not Found")
                }
                return onSuccess(items)
            }) { (error) in
            return onError(error)
        }
    }

    func getAllTermItems(pageIndex: Int, term: String, onSuccess: @escaping ([MovieModel]) -> Void, onError: @escaping (BaseError) -> Void) {
        manager.get(path: .searchMovie, paramaters: queryParamatersPageAndSearch(page: 1, term: term), onSuccess: { (response: BaseResponse<TheMovieBaseModel>) in
                guard let items = response.model?.results else {
                    fatalError(response.message ?? "Not Found")
                }
                return onSuccess(items)
            }) { (error) in
            return onError(error)
        }
    }





}
