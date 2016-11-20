//
//  ColonyViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/20/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class ColonyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var backButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReturnToMain" {
            //go to main menu screen, save colony, update main menu table of colonies if necessary
            print("returning to main screen")
        }
    }
    
}
