//
//  NetworkRouter.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import Foundation

enum DefaultNetworkRouter: NetworkRouter {
    
    case getCharacters
    case getFilteredCharacters(param: CharacterQueryParameters)
    case getEpisodes
    case getLocations
           
    var baseURL: String {
        return "rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
        case .getCharacters, .getFilteredCharacters:
            return "/api/character"
        case .getEpisodes:
            return "/api/episode"
        case .getLocations:
            return "/api/location"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getFilteredCharacters(let param):
            return [URLQueryItem(name: "status", value: param.status)]
        default:
            return []
        }
    }
    
    var method: String {
        switch self {
        default:
            return HTTPMethod.get.rawValue
//        case .getCharacters, .getFilteredCharacters, .getEpisodes, .getLocations:
//            return HTTPMethod.get.rawValue
//        default:
//            return HTTPMethod.post.rawValue
        }
    }
    
    func generateURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        return request
    }
}
