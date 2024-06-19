//
//  ContentView.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import SwiftUI

struct ContentView: View {
    var cManager = CManager()
    @State var token: String?
    @State var tuts: [Tutoring]?
    @State var subjects: [Subject]?
    @State var tut: Tutoring?
    
    var body: some View {
        VStack {
            if let token = token, let tuts = tuts, let subjects = subjects, let tut = tut {
                InfoView(tuts: tuts, subjects: subjects, tut: tut)
                AuthView(token: token)
            // still fetching
            } else {
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
    ContentView(token: previewToken)
}
