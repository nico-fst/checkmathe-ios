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
            CardsView(tuts: previewTuts)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Tutorings")
                }
            InfoView(tuts: previewTuts, subjects: previewSubjects, tut: previewTut)
                .tabItem {
                    Image(systemName: "info.bubble.fill.rtl")
                    Text("Info")
                }
            PaymentsView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Payments")
                }
        }
    }
}

#Preview {
    ContentView()
}
