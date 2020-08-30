//
//  IMovieService.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

protocol IMovieService {
    func getAllItems(pageIndex: Int, onSuccess: @escaping ([MovieModel]) -> Void, onError: @escaping (BaseError) -> Void)
    func getAllTermItems(pageIndex: Int, term: String, onSuccess: @escaping ([MovieModel]) -> Void, onError: @escaping (BaseError) -> Void)
}


extension IMovieService {
    func queryParamatersPage(page : Int) ->Dictionary<String,String> {
        return [
            NetworkQuery.page.rawValue : "\(page)",
            NetworkQuery.lang.rawValue :"en-us",
            NetworkQuery.apiKey.rawValue : ApplicationConstants.shared.apiKey
        ]
    }
    
    func queryParamatersPageAndSearch(page : Int,term:String) ->Dictionary<String,String> {
    
        return [
            NetworkQuery.page.rawValue : "\(page)",
            NetworkQuery.lang.rawValue :"en-us",
            NetworkQuery.apiKey.rawValue : ApplicationConstants.shared.apiKey,
            NetworkQuery.query.rawValue : term
        ]
    }
}




