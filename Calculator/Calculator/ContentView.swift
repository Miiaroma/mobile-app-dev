//
//  ContentView.swift
//  Calculator
//
//  Created by Miia Romanainen on 15.3.2021.
//

import SwiftUI

struct ContentView: View {
    let buttons =
        [
            ["7","8","9","x"],
            ["4","5","6","x"],
            ["1","2","3","x"]
        ]
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
