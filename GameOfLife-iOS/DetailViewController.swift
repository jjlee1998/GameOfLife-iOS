//
//  DetailViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/27/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ColonySelectionDelegate {
    
    @IBOutlet var colonyView: ColonyView!
    @IBOutlet var evolutionButton: UIButton!
    @IBOutlet var colonyNameLabel: UILabel!
    @IBOutlet var generationNumberLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var evolveRateLabel: UILabel!
    @IBOutlet var wrappingSwitch: UISwitch!
    
    let numberFormatter: NumberFormatter = { // Rounds the "rate of evolution" display to 2 decimals
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    var currentColony: Colony! {
        didSet {
            colonyView.setColony(currentColony)
            colonyNameLabel.text = currentColony.name
            generationNumberLabel.text = currentColony.generationNumber.description
            currentColony.wrapping = wrappingSwitch.isOn
        }
    }
    
    var evolveOn = false
    
    var timer: Timer?
    var timerInterval: Double = 1.0 {
        didSet {
            evolveRateLabel.text = "\(numberFormatter.string(from: NSNumber(value: timerInterval))!) s"
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(DetailViewController.timerTasks), userInfo: nil, repeats: true)
    }
    
    func timerTasks() {
        currentColony.evolve()
        colonyView.setNeedsDisplay()
        generationNumberLabel.text = currentColony.generationNumber.description
        if timer!.timeInterval != timerInterval {
            timer!.invalidate()
            startTimer()
        }
    }

    @IBAction func toggleEvolution(_ sender: AnyObject) {
        let button = sender as! UIButton
        if !evolveOn {
            evolveOn = true
            timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(DetailViewController.timerTasks), userInfo: nil, repeats: true)
            button.setTitle("Stop Evolving", for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
        } else {
            timer!.invalidate()
            evolveOn = false
            button.setTitle("Start Evolving", for: .normal)
            button.setTitleColor(UIColor(red:0.00, green:0.50, blue:1.00, alpha:1.0), for: .normal)
        }
    }
    
    // One of the timer tasks is for the timer to replace itself it the interval has changed
    @IBAction func changeTimerInterval(_ sender: AnyObject) {
        let value = Double((sender as! UISlider).value)
        timerInterval = pow(10.0, value)
    }
    
    @IBAction func toggleWrapping(_ sender: AnyObject) {
        let wrapSwitch = sender as! UISwitch
        if wrapSwitch.isOn {
            currentColony.wrappingOn()
        } else {
            currentColony.wrappingOff()
        }
    }
    
    
    func colonySelected(newColony: Colony) {
        currentColony = newColony
        if evolveOn {
            toggleEvolution(evolutionButton)
        }
    }
    
    override func viewDidLoad() {
        currentColony = Colony(name: "Default", size: 60)
    }
}
