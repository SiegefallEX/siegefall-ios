//
//  User.swift
//  ExamensarbeteSwiftUI
//
//  Created by Michihide Sugito on 2025-05-05.
//

import Foundation

struct User: Decodable, Encodable {
    var id: Int
    var email: String
    var username: String
    var password: String
    var stamina: Int
    var diamonds: Int
    var gold: Int
    var characters: [GameCharacter]
    var defense: [GameCharacter?]
    var rankingNormalPvp: Int
    var rankingColloseum: Int
    var pvmWins: Int
    var pvmLosses: Int
    var pvpWins: Int
    var pvpLosses: Int
}
