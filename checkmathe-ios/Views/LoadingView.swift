//
//  LoadingView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Fetching data...")
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .purple))
    }
}

#Preview {
    LoadingView()
}
