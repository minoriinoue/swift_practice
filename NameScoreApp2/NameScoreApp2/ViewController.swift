//
//  ViewController.swift
//  NameScoreApp2
//
//  Created by Minori Inoue on 10/2/16.
//  Copyright © 2016 Minori Inoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendButton.sendActions(for: .touchUpInside)
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nameField.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert() {
        NSLog("This is an output message")
        let VERSION: Float = (UIDevice.current.systemVersion as NSString).floatValue
        if VERSION >= 8.0 {
            let alertController = UIAlertController(title: "Error", message: "Please Enter Your name", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Please enter your name."
            alert.addButton(withTitle: "OK")
            alert.show()
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showResult" {
            if nameField.text == "" {
                self.showAlert()
                return false
            }
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let resultViewController: ResultViewController = segue.destination as! ResultViewController
            resultViewController.myName = (nameField.text)!
            self.nameField.resignFirstResponder()
        }
    }


}

