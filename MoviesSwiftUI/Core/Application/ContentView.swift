//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Veli on 28.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        print(Environments.rootUrl.getEnvironmentValue())
    }
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
