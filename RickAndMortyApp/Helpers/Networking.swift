//
//  Networking.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import Foundation

protocol NetworkRouter {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var method: String { get }
    func generateURLRequest() -> URLRequest?
}

protocol NetworkService {
    func request<T: Decodable>(api: NetworkRouter, completion: @escaping (Result<T,Error>) -> Void)
}

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

fileprivate enum NetworkError: Error {
    case unabeToGenerateRequest
    case invalidEndpoint
    case parsingError
}

final class NetworkManager: NetworkService {
    func request<T: Decodable>(api: NetworkRouter, completion: @escaping (Result<T,Error>) -> Void) {
        guard let request = api.generateURLRequest() else {
            completion(.failure(NetworkError.invalidEndpoint))
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error { completion(.failure(error)); return }
            completion( Result{ try JSONDecoder().decode(T.self, from: data!) })
        }.resume()
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
