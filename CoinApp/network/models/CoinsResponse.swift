//
//  CoinsResponse.swift
//  CoinApp
//
//  Created by Felix kariuki on 15/10/2023.
//

import Foundation


// MARK: - CoinsItemResponse
struct CoinsItemResponse: Codable, Hashable, Identifiable{
    var id = UUID()
    let assetID: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case url
    }
}

typealias CoinsResponse = [CoinsItemResponse]

extension CoinsItemResponse {
    static var dummyCoin:CoinsItemResponse {
        .init(id: UUID(), assetID: "USD", url: "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_128/0a4185f21a034a7cb866ba7076d8c73b.png")
    }
}
