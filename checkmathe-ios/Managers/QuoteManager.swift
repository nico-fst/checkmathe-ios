//
//  PokemonManager.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import Foundation

class QuoteManager {
    // fetches, parses quote
    func getQuote(mode: String) async throws -> QuoteBody {
        // mode = random | today
        guard let url = URL(string: "https://zenquotes.io/api/\(mode)")
        else {fatalError("Missing URL")}
        
        // get data
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard(response as? HTTPURLResponse)?.statusCode == 200
        else { fatalError("Error fetching api data")}
        
        // decode into struct
        let decodedData = try JSONDecoder().decode([QuoteBody].self, from: data)
        
        return decodedData[0]
    }
}

// decode data from API into internal data atype PokeBody
struct QuoteBody: Decodable {
    var q: String
    var a: String
    var h: String
}
