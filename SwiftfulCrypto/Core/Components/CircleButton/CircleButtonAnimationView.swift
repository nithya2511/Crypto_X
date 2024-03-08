//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 06.03.24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
   @Binding var animate : Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .foregroundStyle(Color.theme.accent)
            .animation(animate ? /*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 1.0) : .none)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonAnimationView(animate: .constant(true))
}
