//
//  InfoView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct InfoView: View {
    var cManager = CManager()
    @State var token: String?
    @State var tuts: [Tutoring]?
    @State var subjects: [Subject]?
    @State var tut: Tutoring?
    
    var body: some View {
        VStack {
            if let token = token, let tuts = tuts, let subjects = subjects, let tut = tut {                
                Text(tuts[0].content)
                Text(subjects[0].title)
                Text("\(tut.content) am \(tut.yyyy_mm_dd)")
                
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
                
            } else {  // still fetching
                LoadingView()
                    .task {
                        do {
                            tuts = try await cManager.getSum(stud_username: "demo_user", password: "123", year: "2024", month: "05").tutorings
                            subjects = try await cManager.getSubjects()
                            
                            tut = try await cManager.getTutoring(username: "teacher", password: "123", tut_id: 1)
                            
                            token = try await cManager.getToken(username: "nico_strn", password: "123")
                        } catch {
                            print("Error fetching: \(error)")
                        }
                    }
            }
        }
    }
}



#Preview {
    InfoView(tuts: previewTuts, subjects: previewSubjects, tut: previewTut)
}
