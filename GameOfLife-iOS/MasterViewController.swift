//
//  MasterViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/27/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

protocol ColonySelectionDelegate: class {
    func colonySelected(newColony: Colony)
}

class MasterViewController: UITableViewController {
    
    var colonies = [Colony]()
    var delegate: ColonySelectionDelegate?
    
    override func viewDidLoad() {
        //testing colonies go here until creation gets built
        let c0 = Colony(name: "Colony 0", size: 60)
        c0.randomize()
        
        let c1 = Colony(name: "Colony 1", size: 60)
        c1.randomize()
        
        let c2 = Colony(name: "Colony 2", size: 60)
        c2.randomize()
        
        colonies.append(c0)
        colonies.append(c1)
        colonies.append(c2)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colonies.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colony = self.colonies[indexPath.row]
        self.delegate?.colonySelected(newColony: colony)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
            let colony = self.colonies[indexPath.row]
            cell.textLabel?.text = colony.name
        
            return cell
    }
}
