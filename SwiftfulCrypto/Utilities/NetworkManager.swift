//
//  NetworkManager.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 08.03.24.
//

import Foundation

class NetworkManager {
    
    enum NetworkingError : LocalizedError {
        case downloadError(url : URL)
        case badURLResponse(url : URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .downloadError(url : let url): return "[‼️] Download error for url - \(url)"
            case .badURLResponse(url : let url) : return "[🔥] Bad response from URL. - \(url)"
            case .unknown : return "[‼️]Unknown error occured "
            }
        }
    }
    
    static func download(fromURL url : URL) async throws -> (Data, URLResponse) {
        
        do {
            let (data, response) = try await URLSession.shared.data(from:url)
            return (data, response)
        } catch {
            throw NetworkingError.downloadError(url: url)
        }
    }
    
    static func handleResponse(data : Data?, response : URLResponse?, forURL url : URL) throws -> Data {
        
        guard let data = data,
              let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
         return data
    }
    
    
}
