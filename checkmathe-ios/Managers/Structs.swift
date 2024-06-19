//
//  Structs.swift
//  checkmathe-ios
//
//  Created by Nico Stern on 19.06.24.
//

import Foundation

struct AuthRequest: Codable {
    let username: String
    let password: String
}

struct AuthResponse: Decodable {
    let token: String
}

struct Tutoring: Decodable {
    let id: UInt8
    let yyyy_mm_dd: String
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

struct Subject: Decodable {
    let id: UInt8
    let title: String
}
