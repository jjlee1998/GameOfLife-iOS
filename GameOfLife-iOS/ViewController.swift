//
//  ViewController.swift
//  GameOfLife-iOS
//
//  Created by Jonathan J. Lee on 11/15/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var newColonyButton: UIButton!
    @IBOutlet var loadColonyButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowColony" {
            //pass selected colony to the colony view
            print("moving to colony screen")
        }
        
        if segue.identifier == "ShowCreator" {
            //go to creation screen, pass screen anything it needs and update table of colonies if necessary
            print("moving to creation screen")
        }
    }


}

