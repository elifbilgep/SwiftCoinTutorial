//
//  TopMoversView.swift
//  SwiftCoinTutorial
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Top Movers")
                .font(.headline)
                .fontWeight(.bold)
             
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(viewModel.topCoins){ topCoin in
                        TopMoversItemView(coin: topCoin)
                    }
                }
            }
        }
        .padding()
    }
}


struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
