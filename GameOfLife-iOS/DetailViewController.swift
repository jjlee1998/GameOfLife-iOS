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
    @IBOutlet var colonyView: UIView!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var evoSpeedSlider: UISlider!
    @IBOutlet var evoSpeedDisplay: UILabel!
    @IBOutlet var wrappingToggle: UISwitch!
    
    var currentColony: Colony! {
        didSet (newColony) {
            self.refreshUI()
        }
    }
    
    func refreshUI() {
        //set colony view to display new colony
    }
}
