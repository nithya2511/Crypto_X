//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 09.03.24.
//

import SwiftUI

@MainActor
class CoinImageViewModel : ObservableObject {
    
    @Published var coinImage : UIImage?
    var imageService : CoinImageService
    
    @Published var isLoading : Bool = false
    
    init(forCoin coin : CoinModel) {
        imageService = CoinImageService(forCoin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    func addSubscribers() {
        Task {
            for await values in imageService.$coinImage.values {
                self.coinImage = values
                self.isLoading = false
            }
        }
    }
}
