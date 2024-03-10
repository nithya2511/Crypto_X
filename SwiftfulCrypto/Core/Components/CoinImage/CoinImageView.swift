//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 09.03.24.
//

import SwiftUI

struct CoinImageView: View {

    @StateObject private var vm : CoinImageViewModel

    
    init(coin : CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(forCoin: coin))
    }
    
    var body: some View {
        if let image = vm.coinImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else if vm.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark")
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.instance.coin)
}
