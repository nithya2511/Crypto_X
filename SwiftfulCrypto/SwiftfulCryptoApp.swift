//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 05.03.24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
  
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
        }
    }
}
