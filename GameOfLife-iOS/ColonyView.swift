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
    var multiplier: CGFloat!
    var drawAlive = true
    
    func setColony(_ colony: Colony) {
        self.colony = colony
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        calculateMultiplier() // In case the view happened to change size
        UIColor(red: 1.00, green: 0.78, blue: 0.32, alpha: 1.0).setFill() // Burnt Orange
        for cell in colony.livingCells {
            // Set every cell to a random color to count more easily by eye
            //randomColor().setFill()
            fillCell(cell)
        }
        // Create a black square in the center for reference
        /*UIColor.black.setFill()
        let path2 = UIBezierPath(rect: createCellRect(fromPoint: CGPoint(x: bounds.width / 2, y: bounds.height / 2)))
        path2.fill()*/
    }
    
    // The reason we can get away without comparing the "width" and "height" is that Auto Layout ensures the ColonyView is square
    func calculateMultiplier() {
        multiplier = bounds.width / CGFloat(colony.size)
    }
    
    func fillCell(_ cell: Cell) {
        let path = UIBezierPath(rect: createCellRect(fromPoint: toSystemCGPoint(cell.x, cell.y)))
        path.fill()
    }
    
    func createCellRect(fromPoint: CGPoint) -> CGRect {
        return CGRect(x: fromPoint.x, y: fromPoint.y, width: multiplier, height: multiplier)
    }
    
    func toSystemCGPoint(_ x: Int, _ y: Int) -> CGPoint {
        let newX = multiplier * CGFloat(x)
        let newY = multiplier * CGFloat(colony.size - y - 1)
        return CGPoint(x: newX, y: newY)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    // Steel Blue UIColor(red:0.45, green:0.53, blue:0.65, alpha:1.0).setFill()
}
