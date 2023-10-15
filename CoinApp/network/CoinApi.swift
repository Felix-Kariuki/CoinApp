//
//  CoinApi.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation



protocol ApiBuilder {
    var urlRequest : URLRequest { get }
    var baseUrl : URL { get }
    var path:String { get }
}

enum CoinApi {
    case getCoins
}

extension CoinApi: ApiBuilder {
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        
        request.setValue("47A14571-43EF-4C5B-B113-05735CAECBD1", forHTTPHeaderField: "X-CoinAPI-Key")
        
        return request
    }
    
    var baseUrl: URL {
        switch self {
        case .getCoins:
            return URL(string: "https://rest.coinapi.io/v1")!
        }
    }
    
    var path: String {
        return "/assets/icons/128"
    }
    
    
    
}
