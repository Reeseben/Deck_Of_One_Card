//
//  TopLevelObject.swift
//  DeckOfOneCard
//
//  Created by Ben Erekson on 8/3/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    let cards: [Card]
}
