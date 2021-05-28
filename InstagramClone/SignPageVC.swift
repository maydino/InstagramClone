//
//  ViewController.swift
//  InstagramClone
//
//  Created by Mutlu Aydın on 2/23/21.
//

import UIKit
import Firebase

class SignPageVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authResult, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Connection Error")

                } else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
                
            }
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Connection Error")
                } else{
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
                
            }
        } else {
            self.makeAlert(titleInput: "Error", messageInput: "Username/Password missing")
            
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let kButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(kButton)
        present(alert, animated: true, completion: nil)
        
    }
    
}

