//
//  APIError.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation


enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self{
        case .decodingError:
            return "Failed to decode error from the service"
        case .errorCode(let code):
            return "\(code) - Something Went Wrong"
        case .unknown:
            return "The error is unknown"
        }
        
    }
}
