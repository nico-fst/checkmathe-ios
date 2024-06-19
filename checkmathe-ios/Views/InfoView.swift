//
//  InfoView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct InfoView: View {
    @State var tuts: [Tutoring]
    @State var subjects: [Subject]
    @State var tut: Tutoring
    
    var body: some View {
        VStack {
            Text(tuts[0].content)
            Text(subjects[0].title)
            Text("\(tut.content) am \(tut.yyyy_mm_dd)")
        }
    }
}



//#Preview {
//    InfoView()
//}
