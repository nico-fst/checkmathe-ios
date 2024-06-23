//
//  LoadingView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "arrow.triangle.2.circlepath.icloud")
                .resizable()
                .aspectRatio(contentMode: .fit)  // no distortion
                .frame(width: 80, height: 80)
                .foregroundColor(.purple)
            
            Text("WC to the future!")
                .font(.title)
                .bold()
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .purple))
            Text("Fetching data from the server, slay...")
        }
    }
}

#Preview {
    LoadingView()
}
