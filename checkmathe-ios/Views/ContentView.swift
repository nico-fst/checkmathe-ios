//
//  ContentView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct ContentView: View {
    var quoteManager = QuoteManager()
    @State var quote: QuoteBody? // can be nil
    
    var body: some View {
        VStack {
            if let quote = quote {
                Text("Quote fetched!")
            } else {
                LoadingView()
                    .task {
                        do {
                             quote = try await quoteManager.getQuote(mode: "random")
                        } catch {
                            print("Error getting quote: \(error)")
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
