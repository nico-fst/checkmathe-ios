//
//  ModelData.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import Foundation

var previewQuote: QuoteBody = load("quoteData.json")
var previewToken: String = "afadfc78f8b03f17cc2a753a00bc20a53ca13d1a"

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
