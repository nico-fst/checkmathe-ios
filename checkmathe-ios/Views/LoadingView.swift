//
//  LoadingView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Image(systemName: "arrow.triangle.2.circlepath.icloud")
            .resizable()
            .aspectRatio(contentMode: .fit)  // no distortion
            .frame(width: 80, height: 80)
            .foregroundColor(.purple)
        Text("Hello, QuoteAPI!")
            .font(.title)
            .bold()
            .padding(.bottom, 10)
            .padding(.top, 50)
        Text("Fetching data...")
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .purple))
    }
}

#Preview {
    LoadingView()
}
