//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Daniel Mayo on 06/06/22.
//  Copyright © 2022 Daniel Mayo. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text ,let password = passwordTextfield.text{
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let erro = error{
                print(erro.localizedDescription)
            }else{
                //Ir al chat
                self?.performSegue(withIdentifier: Contants.loginSegue, sender: self)
                }
            }
        }
    }
    
}
