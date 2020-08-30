//
//  Enviroment.swift
//  MoviesSwiftUI
//
//  Created by Veli on 30.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

public enum Environments: String {

    case rootUrl = "ROOT_URL"
    case apiKey = "API_KEY"

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    func getEnvironmentValue() -> String {
        guard let value = Environments.infoDictionary[self.rawValue] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        return value
    }
}
