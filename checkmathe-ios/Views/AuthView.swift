//
//  QuoteView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct AuthView: View {
    var cManager = CManager()
    @State var token: String
    
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
                    Text("Your Token:")
                        .bold().font(.title)
                    Text(token)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    QuoteView(quote: previewQuote)
}
