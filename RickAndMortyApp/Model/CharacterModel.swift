//
//  CharacterModel.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import Foundation

// MARK: - Welcome
struct CharacterBaseModel: Codable {
    let info: Info?
    let results: [CharacterModel]?
}

// MARK: - Result
struct CharacterModel: Codable {
    let id: Int?
    let name: String?
    let status: StatusModel?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: CharacterLocationModel?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct CharacterLocationModel: Codable {
    let name: String?
    let url: String?
}

enum StatusModel: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
