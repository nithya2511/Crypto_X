//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 06.03.24.
//

import SwiftUI

/*
 Request :
 "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
 
 Response :
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 61335,
     "market_cap": 1205414424058,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1288465669257,
     "total_volume": 81923891247,
     "high_24h": 62077,
     "low_24h": 56079,
     "price_change_24h": 787.77,
     "price_change_percentage_24h": 1.30107,
     "market_cap_change_24h": 18104381810,
     "market_cap_change_percentage_24h": 1.52482,
     "circulating_supply": 19646393,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 63541,
     "ath_change_percentage": -3.69291,
     "ath_date": "2024-03-05T15:05:30.729Z",
     "atl": 51.3,
     "atl_change_percentage": 119191.25451,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-03-06T16:32:22.134Z",
     "sparkline_in_7d": {
       "price": [
         58983.94738732378,
         59397.89259241082,
         60465.38088698786,
         61142.98509518815,
         60925.10725370209
       ]
     }
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice : Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let currentHoldings : Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case currentHoldings
    }
    
    func updateHoldings(numOfHoldings : Double) ->CoinModel {
        
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: athChangePercentage, atlDate: athDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, currentHoldings: numOfHoldings)
    }
    
    var currentHoldingValue : Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank : Int {
        return Int(marketCapRank ?? 0)
    }
    
//    var rank : Int {
//        return Int(marketCapRank ?? 0)
//    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}
