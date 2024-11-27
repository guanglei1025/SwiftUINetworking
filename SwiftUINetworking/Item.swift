//
//  Item.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
