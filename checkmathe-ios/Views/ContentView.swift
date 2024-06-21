//
//  ContentView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CardsView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            InfoView(tuts: previewTuts, subjects: previewSubjects, tut: previewTut)
                .tabItem {
                    Image(systemName: "info.bubble.fill")
                    Text("Home")
                }
        }
    }
}

#Preview {
    ContentView()
}
