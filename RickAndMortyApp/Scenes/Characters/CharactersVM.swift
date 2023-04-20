//
//  CharactersVM.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import Foundation

protocol CharactersVMDelegate: AnyObject {
    func updateData()
    func noticeError(error: Error)
}

class CharactersVM {
    
    private let service: NetworkService
    weak var delegate: CharactersVMDelegate?
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    var characters: [CharacterModel] = []
    var collectionViewModel: [CharacterCellModel] = []
    
    func getCharacterList() {
        service.request(api: DefaultNetworkRouter.getCharacters)
        { [weak self] (result: Result<CharacterBaseModel,Error>) in
            switch result {
            case .success(let t):
                self?.characters = t.results ?? []
                self?.prepareCollectionViewData()
            case .failure(let err):
                self?.delegate?.noticeError(error: err)
            }
        }
    }
    
    func getFilteredCharacterList() {
        let param = CharacterQueryParameters(status: "alive", species: "human", gender: "male")
        service.request(api: DefaultNetworkRouter.getFilteredCharacters(param: param))
        { [weak self] (result: Result<CharacterBaseModel,Error>) in
            switch result {
            case .success(let t):
                self?.characters = t.results ?? []
                self?.prepareCollectionViewData()
            case .failure(let err):
                self?.delegate?.noticeError(error: err)
            }
        }
    }
    
    private func prepareCollectionViewData() {
        let model: [CharacterCellModel] = characters.map { c in
            return .init(imageUrl: c.image ?? "",
                         name: c.name ?? "",
                         species: c.species ?? "")
        }
        collectionViewModel = model
        self.delegate?.updateData()
    }
}
