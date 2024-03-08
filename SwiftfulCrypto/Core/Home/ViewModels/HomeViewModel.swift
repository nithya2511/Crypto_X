//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 07.03.24.
//

import SwiftUI
import Combine

class HomeViewModel : ObservableObject {
    
    
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    private var dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        
        dataService.$allCoins.sink { [weak self] returnedCoinArray in
            self?.allCoins = returnedCoinArray
        }
        .store(in: &cancellables)
        
    }
    
    
    
}
