//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Daniel Mayo on 06/06/22.
//  Copyright © 2022 Daniel Mayo. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text,let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let erro = error{
                    print(erro.localizedDescription)
                }else{
                    //Ir al chat
                    self.performSegue(withIdentifier: Contants.registerSegue, sender: self)
                }
            }
        }
    }
    
}
