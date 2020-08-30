//
//  TheMovieBaseModel.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


struct TheMovieBaseModel: Codable {
    let page: Int
    var totalResults: Int?
    var totalPages: Int?
    var results: [MovieModel]
    
    enum TheMovieBaseModel: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
