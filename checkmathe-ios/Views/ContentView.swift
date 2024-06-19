//
//  ContentView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct ContentView: View {
    var quoteManager = QuoteManager()
    var cManager = CManager()
    
    @State var quote: QuoteBody? // can be nil
    @State var token: String?
    
    var body: some View {
        VStack {
//            // sobald successfully fetched
//            if let quote = quote {
//                QuoteView(quote: quote)
//            // still fetching
//            } else {
//                LoadingView()
//                    .task {
//                        do {
//                             quote = try await quoteManager.getQuote(mode: "random")
//                        } catch {
//                            print("Error getting quote: \(error)")
//                        }
//                    }
//            }
            
            if let token = token {
                AuthView(token: token)
            // still fetching
            } else {
                LoadingView()
                    .task {
                        do {
                            token = try await cManager.authUser(username: "nico_strn", password: "123")
                        } catch {
                            print("Error authing: \(error)")
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
