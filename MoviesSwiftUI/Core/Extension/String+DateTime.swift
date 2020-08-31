//
//  String+DateTime.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
extension String {

    func dateFormat() -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = DateManager.shared.isoFormatText


        if let date = formatter.date(from: self) {
            formatter.dateFormat = DateManager.shared.normalFormatText
            let timeValues = formatter.string(from: date)
            return timeValues
        }

        return ""
    }

}
