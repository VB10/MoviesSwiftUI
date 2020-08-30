//
//  BaseError.swift
//  MoviesSwiftUI
//
//  Created by Veli on 28.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import Alamofire

struct BaseError {
    var statusCode: Int?
    var debugMessage: String?

    init(_ afError: AFError?) {
        guard let error = afError else { return }
        debugMessage = error.errorDescription
        statusCode = error.responseCode
    }
}



