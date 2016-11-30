//
//  ColonyView.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/28/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit
import CoreGraphics

class ColonyView: UIView {
    
    var colony: Colony!
    var cOrigin: CGPoint!
    var multiplier: CGFloat!
    
    func setColony(_ colony: Colony) {
        self.colony = colony
    }
    
    override func draw(_ rect: CGRect) {
        calculateSystemDims()
        UIColor.red.setFill()
        for cell in colony.livingCells {
            fillCell(cell)
        }
    }
    
    func calculateSystemDims() {
        let sideLength = smallerBound() * 0.9
        multiplier = sideLength / CGFloat(colony.size)
        cOrigin = CGPoint(x: center.x - (sideLength/2), y: center.y - (sideLength/2))
    }
    
    func smallerBound() -> CGFloat {
        return min(bounds.size.width, bounds.size.height)
    }
    
    func fillCell(_ cell: Cell) {
        let path = UIBezierPath(rect: createCellRect(fromPoint: toSystemCGPoint(cell.x, cell.y)))
        path.fill()
    }
    
    func createCellRect(fromPoint: CGPoint) -> CGRect {
        return CGRect(x: fromPoint.x, y: fromPoint.y, width: multiplier, height: multiplier)
    }
    
    func toSystemCGPoint(_ x: Int, _ y: Int) -> CGPoint {
        let newX = cOrigin.x + (multiplier * CGFloat(x))
        let newY = cOrigin.y + (multiplier * CGFloat(colony.size - y))
        return CGPoint(x: newX, y: newY)
    }
}
