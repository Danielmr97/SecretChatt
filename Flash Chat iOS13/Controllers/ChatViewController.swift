//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Daniel Mayo on 06/06/22.
//  Copyright © 2022 Daniel Mayo. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var bd = Firestore.firestore()
    
    var massages: [Massage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        //navegation propieties
//        navigationItem.title = Contants.appName
//        navigationItem.title.textColor = UIColor(named: "White")
        navigationItem.hidesBackButton = true

        tableView.register(UINib(nibName: Contants.cellNibName , bundle: nil), forCellReuseIdentifier: Contants.cellIdentifier)
        loadMassage()
    }
    
    func loadMassage() {
        
        bd.collection(Contants.FStore.collectionName)
            .order(by: Contants.FStore.dateField)
            .addSnapshotListener  { querySnapshot, error in
            self.massages = []
            if let erro = error{
                print("Problemas al recuperar datos \(erro)")
            }else{
                if let snapshotDocument = querySnapshot?.documents{
                    for document in snapshotDocument {
                        let data = document.data()
                        if let mesageSender = data[Contants.FStore.senderField] as? String, let messageBody = data[Contants.FStore.bodyField] as? String{
                            
                            let newMessage = Massage(sender: mesageSender, body: messageBody)
                            self.massages.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.massages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBudy = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            bd.collection(Contants.FStore.collectionName).addDocument(data: [
                Contants.FStore.senderField : messageSender,
                Contants.FStore.bodyField : messageBudy,
                Contants.FStore.dateField : Date().timeIntervalSince1970
    
            ]) { error in
                if let erro = error{
                    print("Error al guardar data \(erro)")
                }else{
                    print("Se guardo data correctamente")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
      
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = massages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Contants.cellIdentifier, for: indexPath) as! MassageCell
        cell.label.text = massages[indexPath.row].body
        
        //Mensaje de ususario
        if message.sender == Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden = true
            cell.rigthImageView.isHidden = false
            cell.massageBubble.backgroundColor = UIColor(named:  Contants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: Contants.BrandColors.purple)
        }
        
        //Mensaje de otro usuario
        else {
            cell.leftImageView.isHidden = false
            cell.rigthImageView.isHidden = true
            cell.massageBubble.backgroundColor = UIColor(named:  Contants.BrandColors.purple)
            cell.label.textColor = UIColor(named: Contants.BrandColors.lightPurple)
        }
        
        return cell
    }
    
}

