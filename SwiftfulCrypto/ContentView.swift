//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 05.03.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
            
            VStack {
                Text("Accent Color").foregroundStyle(Color.theme.accent)
                    .font(.headline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
