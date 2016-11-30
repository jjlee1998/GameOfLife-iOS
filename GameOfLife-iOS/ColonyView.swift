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
    var sideLength: CGFloat!
    
    var drawAlive = true
    
    func setColony(_ colony: Colony) {
        self.colony = colony
    }
    
    ///////////////////////// Evolution Rendering
    
    override func draw(_ rect: CGRect) {
        calculateSystemDims()
        drawTerritory()
        // Burnt Orange
        UIColor(red: 1.00, green: 0.78, blue: 0.32, alpha: 1.0).setFill()
        for cell in colony.livingCells {
            // Set every cell to a random color to count more easily by eye
            //randomColor().setFill()
            fillCell(cell)
        }
        // Create a black square in the center for reference
        /*UIColor.black.setFill()
        let path2 = UIBezierPath(rect: createCellRect(fromPoint: center))
        path2.fill()*/
    }
    
    func calculateSystemDims() {
        sideLength = smallerBound() * 0.9
        multiplier = sideLength / CGFloat(colony.size)
        cOrigin = CGPoint(x: center.x - (sideLength/2), y: center.y - (sideLength/2))
    }
    
    func smallerBound() -> CGFloat {
        return min(bounds.size.width, bounds.size.height)
    }
    
    func drawTerritory() {
        
        let outerBorder = UIBezierPath(rect: CGRect(x: cOrigin.x - (2 * multiplier),
                                                    y: cOrigin.y - (2 * multiplier),
                                                    width: sideLength + (4 * multiplier),
                                                    height: sideLength + (4 * multiplier)))
        let innerBorder = UIBezierPath(rect: CGRect(origin: cOrigin, size: CGSize(width: sideLength, height: sideLength)))
        // Steel Blue
        UIColor(red:0.45, green:0.53, blue:0.65, alpha:1.0).setFill()
        outerBorder.fill()
        UIColor.gray.setFill()
        innerBorder.fill()
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
        let newY = cOrigin.y + (multiplier * CGFloat(colony.size - y - 1))
        return CGPoint(x: newX, y: newY)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}
