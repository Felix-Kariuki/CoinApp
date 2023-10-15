//
//  CoinState.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation


enum CoinState {
    case loading
    case success(results: [CoinsItemResponse])
    case failed(error:Error)
}
