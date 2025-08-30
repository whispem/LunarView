//
//  ContentView.swift
//  Moon
//
//  Created by Emilie on 30/08/2025.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        MoonView()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
