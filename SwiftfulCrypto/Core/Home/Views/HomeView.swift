//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Nithya Vasudevan on 05.03.24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showPortFolio : Bool = false
    
    
    var body: some View {
        ZStack {
            
           //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                homeHeader
                    
                columnTitles
                
                if (!showPortFolio) {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortFolio{
                    portfolioCoins
                    .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
                
            }
            
        }
    }
}

extension HomeView {
    
    private var homeHeader : some View {
        
        HStack{
            CircleButtonView(iconName: showPortFolio ? "info" : "plus")
                .background(
                CircleButtonAnimationView(animate: $showPortFolio))
                .animation(.none, value: UUID())
            Spacer()
            Text(showPortFolio ? "Portfolio" : "Live Prices")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortFolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortFolio.toggle()
                    }
                }
        }
        .padding()
    }
    
    private var allCoinsList : some View {
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin , showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoins : some View {
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin , showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles : some View {
        
        HStack {
            Text("Coins")
            Spacer()
            if (showPortFolio) {
                Text("Holdings")
            }
            Text("Price")
                .frame(width : UIScreen.main.bounds.width / 3.3)
        }
        .padding(.horizontal)
        .foregroundStyle(Color.theme.secondaryText)
        .font(.caption)
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .toolbar( Visibility.hidden, for: .navigationBar)
            .environmentObject(DeveloperPreview.instance.vm)
    }
}
