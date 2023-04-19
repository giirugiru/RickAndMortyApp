//
//  Model+Helpers.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}
