//
//  ReceiveLatAndLongController.swift
//  Weather2
//
//  Created by CharuwanRuanmoei on 1/14/2559 BE.
//  Copyright © 2559 CharuwanRuanmoei. All rights reserved.
//

import UIKit

class ReceiveLatAndLongController: UIViewController, UITextFieldDelegate {
    
    var titleName:String = ""
    var latitude = String()
    var longitude = String()
    var id: String = ""

    @IBOutlet var saveButton: UIButton!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        latitudeTextField.delegate = self
        longitudeTextField.delegate = self
        
        checkValidLatAndLong()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidLatAndLong()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkValidLatAndLong() {
        latitude = latitudeTextField.text ?? ""
        longitude = longitudeTextField.text ?? ""
        saveButton.enabled = !latitude.isEmpty && !longitude.isEmpty
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
