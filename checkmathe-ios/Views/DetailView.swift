//
//  DetailView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 21.06.24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {  // CSS: top = 0
                ZStack {
                    Image("pdf-signifikanztest")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()  // no overlap
                        .cornerRadius(15)
                }
                .frame(maxWidth: .infinity)
                .shadow(radius: 2)
                
                HStack {
                    Text("Mathe Check")
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                    Image(systemName: "bolt.fill")
                }
            }
            .padding()
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.5863078832626343, green: 0.48692482709884644, blue: 0.8365722894668579, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.6000000238418579, green: 0.8196078538894653, blue: 0.8039215803146362, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.27314817271789327, y: -5.557918181242627e-9),
                endPoint: UnitPoint(x: 0.7175925935365293, y: 1.059999963251207)))
            
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("60min")
                        .padding(5)
                        .foregroundColor(Color.purple)
                        .background(RoundedRectangle(cornerRadius: 99)
                            .strokeBorder(Color.purple, lineWidth: 1)  // normal border would not be rounded
                            .background(RoundedRectangle(cornerRadius: 99).fill(Color.purple).opacity(0.3))  // nested for opacity being applicable
                            .shadow(radius: 5)
                        )
                    Text("01.06.2024")
                }
                .dynamicTypeSize(.xSmall)
                
                Text("Content")
                    .font(.title)
                    .bold()
                Text("Kurvendiskussion anhand mehrerer Beispiele, vor allem Textaufgaben...")
            }
            .padding()
        }
    }
}

#Preview {
    DetailView()
}
