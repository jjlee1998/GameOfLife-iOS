//
//  DetailViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/27/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //use this view controller to build the controls and colony view
    @IBOutlet var colonyView: ColonyView!
    
    var currentColony: Colony! {
        didSet {
            colonyView.setColony(currentColony)
        }
    }
    
    @IBAction func evolveColony(sender: AnyObject) {
        currentColony.evolve()
        colonyView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        currentColony = Colony(name: "testColony", size: 60)
        
        //Add a few random values to make the colony visible for testing
        var add = true
        for x in 0..<60 {
            for y in 0..<60 {
                if add {
                    currentColony.setCellAlive(x, y)
                }
                add = (arc4random_uniform(2) == 1)
            }
        }
    }
}
