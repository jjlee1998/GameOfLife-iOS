//
//  MasterViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 11/27/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var colonies = [Colony]()
    
    override func viewDidLoad() {
        //testing colonies go here until creation gets built
        let c0 = Colony(name: "Colony 0", size: 20)
        let c1 = Colony(name: "Colony 1", size: 20)
        let c2 = Colony(name: "Colony 2", size: 20)
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
            let colony = self.colonies[indexPath.row]
            cell.textLabel?.text = colony.name
        
            return cell
    }
}
