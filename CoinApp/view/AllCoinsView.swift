//
//  AllCoinsView.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel = CoinsViewModelImpl(apiservice:CoinApiServiceImpl())
    
    var body: some View {
       
        
    
        
        
    
        VStack(alignment: .leading){
            
            Spacer()
            
            Text("Coin App")
                .font(.system(size: 22,weight: .semibold))
                .padding(.leading,20)
            
            NavigationView {
                
                Group {
                    
                    switch viewModel.state {
                    case .loading:
                        ProgressView()
                        
                    case .failed(let error):
                        Text("Error ... \(error.localizedDescription)")
                    case .success(let coins):
                        
                        List(coins){coin in
                            
                            CoinItem(coin: coin)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: -8, trailing: 16))
                            
                            
                            
                            
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(PlainListStyle())
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
            }
            .onAppear{
                self.viewModel.getAllCoins()
            }
            
        }
        
  
        
        
        
        
        
        
        
    }
}

#Preview {
    AllCoinsView()
}
