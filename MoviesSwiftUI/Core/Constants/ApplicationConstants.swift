//
//  AppConstants.swift
//  MoviesSwiftUI
//
//  Created by Veli on 28.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


final class ApplicationConstants {
    private static var _shared: ApplicationConstants?

    public static var shared: ApplicationConstants {
        get {
            if let instance = _shared {
                return instance
            } else {
                let _instance = ApplicationConstants()
                _shared = _instance

                return _instance
            }
        }
    }

    private init() { }
    let baseUrl : String =  Environments.rootUrl.getEnvironmentValue()
    let apiKey : String = Environments.apiKey.getEnvironmentValue()
    let networkPageLimitCount : Int = 10
    let imageNetorkPath : String = "https://image.tmdb.org/t/p/w500/"
    
}
