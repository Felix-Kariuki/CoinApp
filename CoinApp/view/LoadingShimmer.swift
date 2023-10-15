//
//  LoadingShimmer.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation
import SwiftUI


struct LoadingShimmer: View {
    var body: some View {
        GeometryReader { geometry in
            let gradient = Gradient(colors: [Color.gray.opacity(0.1), Color.gray, Color.gray.opacity(0.1)])
            let linearGradient = LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .bottom)
            
            Circle()
                .fill(linearGradient)
                .frame(width: 60, height: 60)
                .overlay(
                    Color.white
                        .opacity(0.1)
                        .frame(width: 10, height: 100)
                        .offset(x: -geometry.size.width)
                        .rotationEffect(.degrees(70), anchor: .center)
                )
                //.offset(x: -geometry.size.width)
        }
    }
}

#Preview {
    LoadingShimmer()
}



