//
//  EpisodesVM.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

protocol EpisodesVMDelegate: AnyObject {
    func updateData()
    func noticeError()
}

class EpisodesVM {
    
    private let service: NetworkService
    weak var delegate: EpisodesVMDelegate?
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    var episodes: [EpisodeModel] = []
    var tableViewViewModel: [EpisodeCellModel] = []
    
    func getEpisodeList() {
        service.request(api: DefaultNetworkRouter.getEpisodes)
        { [weak self] (result: Result<EpisodeBaseModel,Error>) in
            switch result {
            case .success(let t):
                self?.episodes = t.results ?? []
                self?.prepareTableViewData()
            case .failure(_):
                self?.delegate?.noticeError()
                self?.prepareTableViewData()
            }
        }
    }
    
    private func prepareTableViewData() {
        let model: [EpisodeCellModel] = episodes.map { c in
            return .init(name: c.name ?? "",
                         season: c.episode ?? "",
                         episode: c.episode ?? "",
                         airDate: c.airDate ?? "")
        }
        tableViewViewModel = model
        self.delegate?.updateData()
    }
}
