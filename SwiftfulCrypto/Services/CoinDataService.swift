//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 08.03.24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins : [CoinModel] = []
    
    //For Combine code 
    private var coinSubscription : AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        
        guard let getAllCoinsURL = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&per_page=100&page=1&sparkline=true&price_change_percentage=24h") else { return
        }
        
        Task {
            do {
            let (data, response) = try await NetworkManager.download(fromURL: getAllCoinsURL)
            let result = try NetworkManager.handleResponse(data: data, response: response, forURL: getAllCoinsURL)
            let decocdedJson = try JSONDecoder().decode([CoinModel].self, from: result)
                allCoins = decocdedJson
            } catch {
                print("Error getting all coins : \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
}

//MARK: - Using Combine Framework 
extension CoinDataService {
    
    private func getCoinsCombine() {
        
        guard let getAllCoinsURL = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&per_page=100&page=1&sparkline=true&price_change_percentage=24h") else { return
        }
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: getAllCoinsURL)
            .subscribe(on: DispatchQueue.global())
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished : break
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnedCoinArray in
                self?.allCoins = returnedCoinArray
                self?.coinSubscription?.cancel()
            }
    }
    
}
