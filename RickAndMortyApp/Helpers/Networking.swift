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
            #if DEBUG
            NetworkLogger.shared.log(request: request, data: data)
            #endif
            if let error = error { completion(.failure(error)); return }
            completion( Result{ try JSONDecoder().decode(T.self, from: data!) })
        }.resume()
    }
}

internal class NetworkLogger {
    
    static let shared = NetworkLogger()
    
    func log(request: URLRequest?, data: Data?) {
        guard let r = request, let d = data else {
            print("🙈🙈🙈 NOTHING HERE 🙈🙈🙈")
            return }
        print("🍄🍄🍄 REQUEST ----> \(r.url?.absoluteString ?? "")")
        print("🛠🛠🛠 METHOD ----> \(r.httpMethod ?? "")")
        print("💆🏻‍♀️💆🏻‍♀️💆🏻‍♀️ HEADER ----> \(r.allHTTPHeaderFields ?? [:])")
        if let body = r.httpBody, let x = String(data: body, encoding: .utf8) {
            print("💃🏻💃🏻💃🏻 BODY ----> \(x)")
        }

        if let jsonData = try? JSONSerialization.jsonObject(with: d, options: []) as? NSDictionary {
            var swiftDict: [String: Any] = [:]
            for key in jsonData.allKeys {
                let stringKey = key as? String
                if let key = stringKey, let keyValue = jsonData.value(forKey: key) {
                    swiftDict[key] = keyValue
                }
            }

            if let jsonDict = try? JSONSerialization.data(withJSONObject: swiftDict, options: .prettyPrinted),
               let theJSONText = String(data: jsonDict, encoding: String.Encoding.ascii) {
                print("🐶🦊🐱🐷🐸 RESPONSE ---->")
                print(theJSONText)
                print("<---- END 🐶🦊🐱🐷🐸")
            }
        }
    }
}
