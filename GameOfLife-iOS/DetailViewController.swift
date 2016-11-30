//
//  DetailViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/27/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ColonySelectionDelegate {
    
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
    
    func colonySelected(newColony: Colony) {
        currentColony = newColony
    }
    
    override func viewDidLoad() {
        currentColony = Colony(name: "blankColony", size: 60)
    }
}
