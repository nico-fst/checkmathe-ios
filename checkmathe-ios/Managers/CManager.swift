//
//  PokemonManager.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import Foundation

class CManager {
    func getToken(username: String, password: String) async throws -> String {
        guard let url = URL(string: "http://192.168.0.108:8000/api/obtain_auth_token/")
        else {fatalError("Missing URL")}
        
        // encode as AuthRequest
        let authData = AuthRequest(username: username, password: password)
        let jsonData = try JSONEncoder().encode(authData)
        
        
        // get data
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            fatalError("Error fetching api data")
        }
        
        // decode into struct
        let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
        return authResponse.token
    }
    
    func getSum(stud_username: String, password: String, year: String, month: String) async throws -> SumBody {
        // pre: get token
        let token = try await getToken(username: stud_username, password: password)
        guard let url = URL(string: "http://192.168.0.108:8000/api/sum/\(stud_username)/\(year)/\(month)/")
        else {fatalError("Missing URL")}
        
        // get data
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            fatalError("Error fetching api data")
        }
        
        // decode into struct
        let decodedData = try JSONDecoder().decode(SumBody.self, from: data)
        return decodedData
    }
}

struct AuthRequest: Codable {
    let username: String
    let password: String
}

struct AuthResponse: Decodable {
    let token: String
}

struct Tutoring: Decodable {
    let id: UInt8
    var yyyy_mm_dd: String
    let subject_title: String
    let teacher_username: String
    let student_username: String
    let content: String
    let pdf: URL?
    let paid: Bool
    let paid_status: String
}

struct SumBody: Decodable, Sequence {
    let sum: Double
    let count_tutorings: Int
    let tutorings: [Tutoring]
    
    func makeIterator() -> IndexingIterator<[Tutoring]> {
        return tutorings.makeIterator()
    }
}
