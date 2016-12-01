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
    
    var timer = Timer()
    var evolveOn = false
    
    @IBAction func toggleEvolution(_ sender: AnyObject) {
        let button = sender as! UIButton
        
        if !evolveOn {
            evolveOn = true
            evolveColony()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(DetailViewController.evolveColony), userInfo: nil, repeats: true)
            button.titleLabel?.text = "Stop"
        } else {
            timer.invalidate()
            evolveOn = false
            button.titleLabel?.text = "Start"
        }
    }
    
    func evolveColony() {
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
