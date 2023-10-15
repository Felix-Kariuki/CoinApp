//
//  CoinsViewModel.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation
import Combine

protocol CoinsViewModel {
    func getAllCoins()
}

class CoinsViewModelImpl:ObservableObject,CoinsViewModel {
    
    private let apiService : CoinApiService
    
    private(set) var coins = [CoinsItemResponse]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: CoinState = .loading
    
    init(apiservice:CoinApiService) {
        self.apiService = apiservice
    }
    
    func getAllCoins() {
        self.state = .loading
        
        let cancellable = apiService.request(from: .getCoins)
            .sink { res in
                switch res {
                    
                case .finished:
                    self.state = .success(results: self.coins)
                   
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.coins = response
            }
        
        self.cancellables.insert(cancellable)
    }
    
}

