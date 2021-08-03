//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Ben Erekson on 8/3/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import UIKit

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
}
