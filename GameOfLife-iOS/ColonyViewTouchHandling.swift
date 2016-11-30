//
//  ColonyViewTouchHandling.swift
//  GameOfLife-iOS
//
//  Created by Jonathan J. Lee on 11/30/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit
import CoreGraphics

extension ColonyView {
    
    func isInColony(_ point: CGPoint) -> Bool {
        let colonyRect = CGRect(origin: cOrigin, size: CGSize(width: sideLength, height: sideLength))
        return colonyRect.contains(point)
    }
    
    func toColonyCell(_ point: CGPoint) -> Cell? {
        if isInColony(point) {
            let x = Int((point.x - cOrigin.x) / multiplier)
            let y = colony.size - Int((point.y - cOrigin.y) / multiplier) - 1
            return Cell(x, y)
        } else {
            return nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        let touchCell: Cell? = toColonyCell(location)
        if let cell = touchCell {
            if colony.isCellAlive(cell.x, cell.y) {
                colony.setCellDead(cell.x, cell.y)
                drawAlive = false
            } else {
                colony.setCellAlive(cell.x, cell.y)
                drawAlive = true
            }
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        let touchCell: Cell? = toColonyCell(location)
        if let cell = touchCell {
            if drawAlive {
                colony.setCellAlive(cell.x, cell.y)
            } else {
                colony.setCellDead(cell.x, cell.y)
            }
            setNeedsDisplay()
        }
    }
}
