//
//  CharactersVM.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import Foundation

protocol CharactersVMDelegate: AnyObject {
    func updateData()
    func noticeError()
}

class CharactersVM {
    private let service: NetworkService
    weak var delegate: CharactersVMDelegate?
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    func getCharacterList() {
        service.request(api: DefaultNetworkRouter.getCharacters)
        { [weak self] (result: Result<CharacterBaseModel,Error>) in
            switch result {
            case .success(let success):
                self?.delegate?.updateData()
            case .failure(let failure):
                self?.delegate?.noticeError()
            }
        }
    }
    
    func getFilteredCharacterList() {
        let param = CharacterQueryParameters(status: "alive", species: "human", gender: "male")
        service.request(api: DefaultNetworkRouter.getFilteredCharacters(param: param))
        { [weak self] (result: Result<CharacterBaseModel,Error>) in
            switch result {
            case .success(let success):
                self?.delegate?.updateData()
            case .failure(let failure):
                self?.delegate?.noticeError()
            }
        }
    }
}
