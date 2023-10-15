//
//  CoinItem.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import SwiftUI

struct CoinItem: View {
    
    let coin: CoinsItemResponse
    
    var body: some View {
        HStack {
            
            
            AsyncImage(url: URL(string: coin.url )) { phase in
                           switch phase {
                           case .empty:
                               LoadingShimmer()
                           case .success(let image):
                               image
                                   .resizable()
                                   
                           case .failure:
                               LoadingShimmer()
                           @unknown default:
                               LoadingShimmer()
                           }
                       }
            .frame(width: 60,height: 60)
            
            
            VStack(alignment: .leading, spacing: 4){
                Text(coin.assetID )
                    .foregroundColor(.black)
                    .font(.system(size: 16,weight: .semibold))
                
                Text("\(coin.assetID): updated 0 min ago" )
                    .foregroundColor(.gray)
                   // .font(.footnote)
                    .font(.system(size: 11,weight: .light))
                
               
                   
//                        Text(date,style: .date)
//                            .foregroundColor(.gray)
//                            .font(.system(size: 12,weight: .bold))
//                        Text(date,style: .time)
//                            .foregroundColor(.gray)
//                            .font(.system(size: 12))
                    
                    

                
            }
            
            
            
            
        }
        .padding()
        
        
        
        
        
    }
}

#Preview {
    CoinItem(coin: CoinsItemResponse.dummyCoin)
}
