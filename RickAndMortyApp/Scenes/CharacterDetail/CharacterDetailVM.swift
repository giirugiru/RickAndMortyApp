//
//  CharacterDetailVM.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

protocol CharacterDetailVMDelegate: AnyObject {
    func updateData(model: CharacterDetailVCModel)
    func noticeError()
}

class CharacterDetailVM {
    
    var character: CharacterModel?

    weak var delegate: CharacterDetailVMDelegate?
    
    func getCharacterDetail() {
        guard let character else {
            delegate?.noticeError()
            return }
        
        let model = CharacterDetailVCModel(
            name: character.name ?? "",
            imageUrl: character.image ?? "",
            status: character.status?.rawValue ?? "",
            gender: character.gender?.rawValue ?? "",
            species: character.species ?? "",
            created: character.created ?? "",
            origin: character.origin?.name ?? "",
            location: character.location?.name ?? "",
            episode: character.episode ?? [])
        
        delegate?.updateData(model: model)
    }
}
