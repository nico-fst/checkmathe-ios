//
//  PokemonManager.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import Foundation

class CManager {
    struct AuthRequest: Codable {
        let username: String
        let password: String
    }
    
    func authUser(username: String, password: String) async throws -> String {
        guard let url = URL(string: "http://192.168.0.103:8000/api/obtain_auth_token/")
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
        let decodedData = String(decoding: data, as: UTF8.self)
        return decodedData
    }
}
