//
//  LocationModel.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

// MARK: - Welcome
struct LocationBaseModel: Codable {
    let info: Info?
    let results: [LocationModel]?
}

// MARK: - Result
struct LocationModel: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
