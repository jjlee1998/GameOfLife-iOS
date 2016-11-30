//
//  Colony.swift
//  GameOfLife-iOS
//
//  Created by Jonathan J. Lee on 11/29/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class Colony: CustomStringConvertible {
    
    var name: String
    var size: Int
    var livingCells = Set<Cell>()
    var generationNumber = 0
    
    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
    
    func isGoodCell(_ cell: Cell) -> Bool {
        if (cell.x < size) && (0 <= cell.x) && (cell.y < size) && (0 <= cell.y) {
            return true
        } else {
            return false
        }
    }
    
    func setCellAlive(_ xCoor: Int, _ yCoor: Int) {
        let cell = Cell(xCoor, yCoor)
        if isGoodCell(cell) {
            livingCells.insert(cell)
        }
    }
    
    func setCellDead(_ xCoor: Int, _ yCoor: Int) {
        livingCells.remove(Cell(xCoor, yCoor))
    }
    
    func resetColony() {
        livingCells.removeAll()
        generationNumber = 0
    }
    
    func isCellAlive(_ xCoor: Int, _ yCoor: Int) -> Bool {
        return livingCells.contains(Cell(xCoor, yCoor))
    }
    
    func evolve() {
        generationNumber += 1
        let newCells = livingCells.flatMap({cellsSurrounding($0)})
            .filter({aliveNextGen($0)})
            .filter({isGoodCell($0)})
        livingCells = Set<Cell>(newCells)
    }
    
    func cellsSurrounding(_ cell: Cell) -> Set<Cell> {
        var result = Set<Cell>()
        for x in cell.x - 1 ... cell.x + 1 {
            for y in cell.y - 1 ... cell.y + 1 {
                result.insert(Cell(x, y))
            }
        }
        return result
    }
    
    func aliveNextGen(_ cell: Cell) -> Bool{
        var surroundingCells = cellsSurrounding(cell)
        surroundingCells.formIntersection(livingCells)
        surroundingCells.remove(cell)
        switch surroundingCells.count {
        case 3:
            return true
        case 2:
            return livingCells.contains(cell)
        default:
            return false
        }
    }
    
    func randomize() {
        var add = true
        for x in 0..<size {
            for y in 0..<size {
                if add {
                    setCellAlive(x, y)
                }
                add = (arc4random_uniform(2) == 1)
            }
        }
    }
    
    var description: String {
        var result = "Generation # \(generationNumber)\n"
        for xCoor in 0..<size {
            for yCoor in 0..<size {
                if isCellAlive(xCoor, yCoor) {
                    result += "*"
                } else {
                    result += " "
                }
            }
            result += "\n"
        }
        return result
    }
}
