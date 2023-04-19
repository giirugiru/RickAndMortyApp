//
//  CharacterDetailRouter.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

protocol CharacterDetailRouterProtocol: AnyObject {
    static func create(character: CharacterModel) -> CharacterDetailVC
}

class CharacterDetailRouter: CharacterDetailRouterProtocol {
    static func create(character: CharacterModel) -> CharacterDetailVC {
        let vc = CharacterDetailVC()
        let vm = CharacterDetailVM()
        vm.character = character
        vc.vm = vm
        return vc
    }
}
