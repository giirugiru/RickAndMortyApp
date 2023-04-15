//
//  CharactersVM.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import Foundation


class CharactersVM {
    let service: NetworkService
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    func getCharacterList() {
        service.fetchData(
            urlString: Constants.shared.getAllCharacters)
        { [weak self] (result : Result<CharacterBaseModel,Error>) in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
