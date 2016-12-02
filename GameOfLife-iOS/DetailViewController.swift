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
    
    @IBOutlet var colonyNameLabel: UILabel!
    @IBOutlet var generationNumberLabel: UILabel!
    
    var currentColony: Colony! {
        didSet {
            colonyView.setColony(currentColony)
            colonyNameLabel.text = currentColony.name
            generationNumberLabel.text = currentColony.generationNumber.description
        }
    }
    
    var timer = Timer()
    var evolveOn = false
    
    @IBAction func toggleEvolution(_ sender: AnyObject) {
        let button = sender as! UIButton
        
        if !evolveOn {
            evolveOn = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(DetailViewController.evolveColony), userInfo: nil, repeats: true)
            button.setTitle("Stop Evolving", for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
        } else {
            timer.invalidate()
            evolveOn = false
            button.setTitle("Start Evolving", for: .normal)
            button.setTitleColor(UIColor(red:0.00, green:0.50, blue:1.00, alpha:1.0), for: .normal)
        }
    }
    
    func evolveColony() {
        currentColony.evolve()
        colonyView.setNeedsDisplay()
        generationNumberLabel.text = currentColony.generationNumber.description
    }
    
    
    func colonySelected(newColony: Colony) {
        currentColony = newColony
    }
    
    override func viewDidLoad() {
        currentColony = Colony(name: "blankColony", size: 60)
    }
}
