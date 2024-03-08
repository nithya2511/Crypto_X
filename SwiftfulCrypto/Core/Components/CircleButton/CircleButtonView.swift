//
//  CircleButtonView.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 05.03.24.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName : String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .frame(width: 50, height: 50)
            .foregroundColor(Color.theme.accent)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
                    .shadow(
                        color: Color.theme.accent.opacity(0.25),
                        radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            )
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")
            
    }
}
