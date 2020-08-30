//
//  NetworkManager.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import Alamofire


class NetworkManager: INetworkManager {
    func get<T>(path: NetworkPath,paramaters: [String: String]? = nil, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Decodable, T: Encodable {

        AF.request(networkRequestUrl(path),
            method: .get,
            parameters: paramaters
        ).validate().responseDecodable(of: T.self)
        { (response) in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: ""))
        }
    }


}
