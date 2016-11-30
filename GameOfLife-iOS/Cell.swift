//
//  Cell.swift
//  GameOfLife-iOS
//
//  Created by Jonathan J. Lee on 11/29/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

struct Cell: Hashable {
    
    var x: Int
    var y: Int
    var hashValue: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
        hashValue = ((x + y)*(x + y + 1)/2) + y     //The Cantor Pairing Function
    }
    
    static func == (firstCell: Cell, secondCell: Cell) -> Bool {
        return firstCell.hashValue == secondCell.hashValue
    }
}
