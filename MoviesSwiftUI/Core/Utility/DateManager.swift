//
//  DateManager.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

 class DateManager {
    static let shared = DateManager()
    
    private init() {}
    
    let isoFormatText = "yyyy-MM-dd'T'HH:mm:ssZ"
    let normalFormatText = "yyyy MMM EEEE HH:mm"
    
}
