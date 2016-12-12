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
    
    @IBOutlet var editButton: UIBarButtonItem!
    
    var colonyStore: ColonyStore!
    var delegate: ColonySelectionDelegate?
    
    override func viewDidLoad() {

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colonyStore.colonies.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colony = self.colonyStore.colonies[indexPath.row]
        self.delegate?.colonySelected(newColony: colony)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColonyTableViewCell", for: indexPath as IndexPath) as! ColonyTableViewCell
        
            let colony = self.colonyStore.colonies[indexPath.row]
            cell.nameLabel?.text = colony.name
            cell.sizeLabel?.text = "\(colony.size)x\(colony.size)"
        
            return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        colonyStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let colony = colonyStore.colonies[indexPath.row]
            
            let title = "Delete \(colony.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                self.colonyStore.removeItem(colony)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            let popoverPresentationController = ac.popoverPresentationController
            popoverPresentationController?.barButtonItem = editButton
            
            present(ac, animated: true, completion: nil)
        }
    }

    
    @IBAction func toggleEditingMode(_ sender: AnyObject) {
        
        if isEditing {
            setEditing(false, animated: true)
        } else {
            setEditing(true, animated: true)
        }
        
    }
    
    @IBAction func unwindToColonyList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CreationViewController {
            let colony = sourceViewController.colony
            let newIndexPath = IndexPath(row: colonyStore.colonies.count, section: 0)
            colonyStore.createItem(colony: colony!)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            
            self.delegate?.colonySelected(newColony: colony!)
        }
    }
}
