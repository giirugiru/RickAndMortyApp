//
//  CharacterModel.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CharacterBaseModel: Codable {
    let info: Info?
    let results: [CharacterModel]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct CharacterModel: Codable {
    let id: Int?
    let name: String?
    let status: StatusModel?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: LocationModel?
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
struct LocationModel: Codable {
    let name: String?
    let url: String?
}

enum StatusModel: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
