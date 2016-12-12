//
//  CreationViewController.swift
//  GameOfLife-iOS
//
//  Created by Cameron Martin on 12/4/16.
//  Copyright © 2016 Jonathan J. Lee. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController, UITextFieldDelegate {
    
    var colony: Colony?
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var sizeField: UITextField!
    @IBOutlet var templateSelector: UISegmentedControl!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var templateDescriptionLabel: UILabel!
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func attemptUnwind() {
        var doSegue = true
        if nameField.text! == "" {
            doSegue = false
            nameField.backgroundColor = UIColor(red:1.00, green:0.42, blue:0.42, alpha:1.0)
        }
        if sizeField.text! == "" {
            doSegue = false
            sizeField.backgroundColor = UIColor(red:1.00, green:0.42, blue:0.42, alpha:1.0)
        }
        if doSegue {
            performSegue(withIdentifier: "returnToColonyList", sender: self)
        }
    }
    
    @IBAction func updateTemplateDescriptionLabel(sender: AnyObject) {
        let templateNumber = templateSelector.selectedSegmentIndex
        switch templateNumber {
        case 1:
            templateDescriptionLabel.text = "Basic: evolves into a quartet of oscillating bars."
        case 2:
            templateDescriptionLabel.text = "Glider Gun: continually shoots out gliders. Minimum size is 40; will automatically increase size to 40 to fit if you set a lesser value."
        case 3:
            templateDescriptionLabel.text = "Random: every cell is randomly set to alive or dead."
        default:
            templateDescriptionLabel.text = "Blank: a completely empty colony."
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == sizeField && (string != "" && string.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) == nil) {
            return false
        } else {
            if textField.backgroundColor != UIColor.white {
                textField.backgroundColor = UIColor.white
            }
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = nameField?.text
        let size = sizeField?.text
            
        colony = Colony(name: name!, size: Int(size!)!, template: templateSelector.selectedSegmentIndex)
    }
    
}
