//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Ben Erekson on 8/3/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case couldNotDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server."
        case .thrownError(let error):
            return "Error: \(error.localizedDescription)"
        case .noData:
            return "No data for Card"
        case .couldNotDecode:
            return "Could not decode JSON object from server"
        }
    }
    
}
