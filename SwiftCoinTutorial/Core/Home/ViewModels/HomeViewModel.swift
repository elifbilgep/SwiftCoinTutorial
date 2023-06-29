//
//  HomeViewModel.swift
//  SwiftCoinTutorial
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI

class HomeViewModel : ObservableObject{
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    
    init(){
        fetchCoinData()
        configureTopMovingCoins()
    }
    
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response code: \(response.statusCode)")
            }
            
            
            guard let data = data else {return}
            print("DEBUG data \(data)")
            
            do{//decoding
                let coins = try JSONDecoder().decode([Coin].self ,from: data)
                
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
                
                //print("DEBUG: Coins \(coins)")
            }catch let error{
                print("DEBUG: Error occured decoding \(error)")
            }
            
        }.resume()
        
    }
    
    func configureTopMovingCoins(){
        let topMovers = self.coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H}) 
        self.topCoins = Array(topMovers.prefix(5))
        
    }
}
