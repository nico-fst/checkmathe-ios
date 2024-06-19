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
    
    var body: some View {
        VStack {
            if let token = token {
                AuthView(token: token)
            // still fetching
            } else {
                LoadingView()
                    .task {
                        do {
                            let tuts = try await cManager.getSum(stud_username: "demo_user", password: "123", year: "2024", month: "05")
                            for tutoring in tuts {
                                print(tutoring.content, tutoring.yyyy_mm_dd)
                            }
                            
                            let subjects = try await cManager.getSubjects()
                            for subj in subjects {
                                print(subj.title)
                            }
                            
                            let tut = try await cManager.getTutoring(username: "teacher", password: "123", tut_id: 1)
                            print("Am \(tut.yyyy_mm_dd) wurde \(tut.duration_in_min) lang Folgendes gecoached: \(tut.content)")
                            
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
