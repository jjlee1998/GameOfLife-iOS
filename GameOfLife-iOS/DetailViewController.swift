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
        print("hullo")
    }
    
    override func viewDidLoad() {
        currentColony = Colony(name: "testColony", size: 60)
        
        //Add a few values to make the colony visible for testing
        var addOne = true
        for x in 0..<60 {
            addOne = !addOne
            for y in 0..<60 {
                if addOne {
                    currentColony.setCellAlive(x, y)
                }
                addOne = !addOne
            }
        }
    }
}
