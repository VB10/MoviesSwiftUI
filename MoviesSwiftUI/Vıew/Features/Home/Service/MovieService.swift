//
//  MovieService.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


class MovieService: IMovieService {
    func getAllTermItems(pageIndex: Int, term: String, onSuccess: @escaping ([MovieModel]) -> Void, onError: @escaping (BaseError) -> Void) {
        
    }
    



    private let manager: INetworkManager

    init() {
        manager = NetworkManager()
    }


    func getAllItems(pageIndex: Int, onSuccess: @escaping ([MovieModel]) -> Void, onError: @escaping (BaseError) -> Void) {
        manager.get(path: .movieTopRated, paramaters: nil, onSuccess: { (response: BaseResponse<TheMovieBaseModel>) in
//            guard let items = response.model?.results else {
////                MARK: Return Error Scene
//                fatalError(response.message ?? "Not Found")
//            }
            return onSuccess([])
        }) { (error) in
            return onError(error)
        }
    }

    
}
