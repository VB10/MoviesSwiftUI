//
//  ActivityIndicator.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {

    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    var configuration = { (indicator: UIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}
