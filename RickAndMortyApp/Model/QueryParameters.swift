//
//  QueryParameters.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

struct CharacterQueryParameters {
    let status: String
    let species: String
    let gender: String
    
    init(status: String, species: String, gender: String) {
        self.status = status
        self.species = species
        self.gender = gender
    }
}
