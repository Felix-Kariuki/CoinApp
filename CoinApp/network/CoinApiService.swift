//
//  CoinApiService.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation
import Combine

protocol CoinApiService {
    func request(from endpoint: CoinApi) -> AnyPublisher<CoinsResponse,APIError>
}

struct CoinApiServiceImpl: CoinApiService {
    func request(from endpoint : CoinApi) -> AnyPublisher<CoinsResponse,APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unknown}
            .flatMap{data, response -> AnyPublisher<CoinsResponse,APIError> in
                
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type:  CoinsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                }else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
                
            }
            .eraseToAnyPublisher()
    }
    
}
