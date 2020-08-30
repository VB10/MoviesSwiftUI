//
//  NetworkManager+Path.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

extension NetworkManager {
    func networkRequestUrl(_ path: NetworkPath) -> String {
        return ApplicationConstants.shared.baseUrl + path.rawValue
    }
}

