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
                            
                            token = try await cManager.getToken(username: "nico_strn", password: "123")
                        } catch {
                            print("Error authing: \(error)")
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView(token: previewToken)
}
