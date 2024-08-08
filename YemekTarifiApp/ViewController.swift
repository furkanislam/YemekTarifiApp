//
//  ViewController.swift
//  YemekTarifiApp
//
//  Created by Furkan İSLAM on 4.08.2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }

    @IBAction func buttonClickedSignIn(_ sender: Any) {
        
        if textFieldEmail.text != "" && textFieldPassword.text != "" {
            Auth.auth().signIn(withEmail: textFieldEmail.text!, password: textFieldPassword.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
        
    }
    
    @IBAction func buttonClickedSignUp(_ sender: Any) {
        if textFieldEmail.text != "" && textFieldPassword.text != "" {
            Auth.auth().createUser(withEmail: textFieldEmail.text!, password: textFieldPassword.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Usarname/Password?")
        }
    }
    
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

