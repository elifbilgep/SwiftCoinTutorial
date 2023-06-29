//
//  TopMoversItemView.swift
//  SwiftCoinTutorial
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin : Coin
    
    var body: some View {
        VStack(alignment: .leading){
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            
            //coin info
            HStack(spacing: 2){
                Text("\(coin.symbol.uppercased())")
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            //coin percent change
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        
        .frame(width: 140,height: 140)
        .background(Color("ItemBackgroundColor"))
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
            )
    }
}

/*
struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemView()
    }
}
*/
