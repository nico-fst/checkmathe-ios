//
//  QuoteView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct QuoteView: View {
    var quoteManager = QuoteManager()
    @State var quote: QuoteBody
    @State var isLoading = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack() {
                Image(systemName: "quote.opening")
                    .resizable()
                    .aspectRatio(contentMode: .fit)  // no distortion
                    .frame(width: 80, height: 80)
                    .foregroundColor(.purple)
                    .padding(.top, 100)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(quote.a)
                        .bold().font(.title)
                    Text(quote.q)
                }
                
                Spacer()
                
                Button(action: {fetchRandomQuote()}) {
                    Text("New Quote")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .disabled(isLoading)  // disabled if fetching new quote
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
    
    private func fetchRandomQuote() {
        isLoading = true
        
        Task {
            do {
                let newQuote = try await quoteManager.getQuote(mode: "random")
                self.quote = newQuote
            } catch {
                print(error)
            }
        }
            
        isLoading = false
    }
}

#Preview {
    QuoteView(quote: previewQuote)
}
