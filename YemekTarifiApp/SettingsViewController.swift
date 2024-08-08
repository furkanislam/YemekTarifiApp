//
//  SettingsViewController.swift
//  YemekTarifiApp
//
//  Created by Furkan İSLAM on 4.08.2024.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "toViewController", sender: nil)
                   
               } catch {
                   print("Error")
               }
    }
}
