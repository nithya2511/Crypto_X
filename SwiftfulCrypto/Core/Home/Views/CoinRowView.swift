//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 06.03.24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    let showHoldingsColumn : Bool
    
    var body: some View {
        HStack(spacing : 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
        
        
    }
}

extension CoinRowView {
    
    var leftColumn : some View {
        HStack(spacing : 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 20)
            Circle()
                .frame(width: 50, height: 50)
            Text(coin.symbol)
                .textCase(.uppercase)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .padding(.leading, 6)
        }
    }
    
    var centerColumn : some View {
        
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingValue.asCurrencyStringWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    var rightColumn : some View {
        
        VStack(alignment : .trailing) {
            Text(coin.currentPrice.asCurrencyStringWith6Decimals())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            Text((coin.priceChangePercentage24H ?? 0).asPercentString())
                .foregroundStyle(coin.priceChangePercentage24H ?? 0 >= 0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.3 )
    }
}

#Preview(traits: .sizeThatFitsLayout){
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
}
