//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 09.03.24.
//

import Foundation
import SwiftUI

class CoinImageService {
    
    @Published var coinImage : UIImage?
    private let coin : CoinModel
    private let folderName = "Coin_Images"
    private let imageName : String
    private var fileManager = LocalFileManager.instance
    
    init(forCoin coin : CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let image = fileManager.getImage(imageName: imageName, folderName: folderName) {
            self.coinImage = image
            print("Retrieved Coin Image")
        } else {
            downloadCoinImage()
            print("Downloading Coin Image")
        }
        
    }
    
    private func downloadCoinImage() {
        guard let getCoinImageURL = URL(string: coin.image) else { return
        }
        Task {
            do {
                let (data, response) = try await NetworkManager.download(fromURL: getCoinImageURL)
                let resultData = try NetworkManager.handleResponse(data: data, response: response, forURL: getCoinImageURL)
                if let image = UIImage(data: resultData) {
                    self.coinImage = image
                    self.fileManager.saveImage(image: image, imageName: imageName, folderName: folderName)
                }
            }catch {
                print("Error in getting Coin image : \(error.localizedDescription)")
            }
        }
    }
}
