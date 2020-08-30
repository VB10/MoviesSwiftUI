//
//  INetworkManager.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


 protocol INetworkManager {
    func get<T : Codable>(path: NetworkPath,paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
}
