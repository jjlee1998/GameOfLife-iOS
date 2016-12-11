//
//  CreationViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 12/4/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var sizeField: UITextField!
    @IBOutlet var templateSelector: UISegmentedControl!
    @IBOutlet var saveButton: UIButton!
    
    var colony: Colony?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((string.rangeOfCharacter(from: NSCharacterSet.punctuationCharacters) != nil) || string.rangeOfCharacter(from: NSCharacterSet.letters) != nil) {
            return false
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = nameField?.text
        let size = sizeField?.text
            
        colony = Colony(name: name!, size: Int(size!)!, template: templateSelector.selectedSegmentIndex)
    }
    
}
