//
//  LocationsVM.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

protocol LocationsVMDelegate: AnyObject {
    func updateData()
    func noticeError()
}

class LocationsVM {
    
    private let service: NetworkService
    weak var delegate: LocationsVMDelegate?
    
    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    var locations: [LocationModel] = []
    var tableViewViewModel: [LocationCellModel] = []
    
    func getLocationList() {
        service.request(api: DefaultNetworkRouter.getLocations)
        { [weak self] (result: Result<LocationBaseModel,Error>) in
            switch result {
            case .success(let t):
                self?.locations = t.results ?? []
                self?.prepareTableViewData()
            case .failure(_):
                self?.delegate?.noticeError()
                self?.prepareTableViewData()
            }
        }
    }
    
    private func prepareTableViewData() {
        let model: [LocationCellModel] = locations.map { c in
            return .init(name: c.name ?? "",
                         type: c.type ?? "",
                         dimension: c.dimension ?? "")
        }
        tableViewViewModel = model
        self.delegate?.updateData()
    }
}
