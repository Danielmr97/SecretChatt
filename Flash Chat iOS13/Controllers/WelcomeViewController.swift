//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Daniel Mayo on 06/06/22.
//  Copyright © 2022 Daniel Mayo. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Animacion Welcome
        titleLabel.text = Contants.appName

    }

}
