//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 07.03.24.
//

import SwiftUI

extension Double {
    
    ///Converts the Double into Currency with 2 decimal places
    ///```
    ///1234,567 -> ¢123.4,56
    ///```
    var currencyFormatter2Decimals : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        return formatter
    }
    
    ///Converts the Double into Currency as a String with 2 decimal places
    ///```
    ///1234,567 -> ¢123.4,56
    ///```
    func asCurrencyStringWith2Decimals() -> String {
        
        let number = NSNumber(value: self)
        return currencyFormatter2Decimals.string(from: number) ?? "0,00¢"
    }
    
    ///Converts the Double into Currency with 2 - 6 decimal places
    ///```
    ///1234,567 -> ¢123.4,567
    ///12,3456 -> ¢12,3456
    ///0.1234567 -> ¢0,123456
    ///```
    var currencyFormatter6Decimals : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        return formatter
    }
    
    ///Converts the Double into Currency as a String with 2 - 6 decimal places
    ///```
    ///1234,567 -> ¢123.4,567
    ///12,3456 -> ¢12,3456
    ///0.1234567 -> ¢0,123456
    ///```
    func asCurrencyStringWith6Decimals() -> String {
        
        let number = NSNumber(value: self)
        return currencyFormatter6Decimals.string(from: number) ?? "0,00¢"
    }
    
    var commaDecimalFormatter2Decimals : NumberFormatter {
        var formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    ///Converts the Double into a String with 2 decimal places
    ///```
    ///1234,567 -> ¢123.4,567
    ///```
    func asNumberString() -> String {
        let number = NSNumber(value:  self)
        return commaDecimalFormatter2Decimals.string(from: number) ?? "0,00"
    }
    
    ///Converts the Double into a string with percentage symbol
    ///```
    ///1234,567 -> ¢123.4,567
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
    
    
}
