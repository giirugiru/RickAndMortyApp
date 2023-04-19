//
//  EpisodeModel.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

// MARK: - Welcome
struct EpisodeBaseModel: Codable {
    let info: Info?
    let results: [EpisodeModel]?
}

// MARK: - Result
struct EpisodeModel: Codable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
