//
//  PaymentView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 24.06.24.
//

import SwiftUI

struct PaymentsView: View {
    @State var showDetail = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 5) { item in
                    PaymentItemView()
                        .sheet(isPresented: $showDetail, content: {
                            DetailView()
                        })
                        .onTapGesture {
                            showDetail.toggle()
                        }
                }
            }
            .navigationTitle("Payments")
        }
    }
}

#Preview {
    PaymentsView()
}

struct PaymentItemView: View {
    var body: some View {
        HStack(alignment: .top) {
            Text("01")
            VStack(alignment: .leading, spacing: 12) {
                Text("Month")
                    .bold()
                Text("In diesem Monat haben wir so und so viel gemacht bla bla")
            }
        }
    }
}
