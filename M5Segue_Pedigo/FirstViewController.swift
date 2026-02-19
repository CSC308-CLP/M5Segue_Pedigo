//
//  ViewController.swift
//  M5Segue_Pedigo
//
//  Created by Pedigo, Charles L. on 2/19/26.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func actionSegue(_ sender: Any) {
        statusLabel.text = "Action Segue triggered"
        //Alert
        guard let name = nameField.text, !name.isEmpty else{
            let alert = UIAlertController(title: "Hold on!", message: "Please enter your name", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        
    }
    
    @IBAction func manualSegue(_ sender: Any) {
        statusLabel.text = "Manual Segue triggered"
        performSegue(withIdentifier: "ManualSegue", sender: self)
        //Alert
        guard let name = nameField.text, !name.isEmpty else{
            let alert = UIAlertController(title: "Hold on!", message: "Please enter your name", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
    }
    
    @IBAction func programmicNavigation(_ sender: Any) {
        statusLabel.text = "Programmic triggered"
        //Alert
        guard let name = nameField.text, !name.isEmpty else{
            let alert = UIAlertController(title: "Hold on!", message: "Please enter your name", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        
        let sb = storyboard ?? UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
            return
        }
        vc.receivedTitle = "Programmatic"
        vc.receivedName = name
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    @IBAction func unwindToFirstVC(_ sender: UIStoryboardSegue){
        statusLabel.text = "Unwind to FirstVC"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? SecondViewController{
            if let id = segue.identifier {
                dest.receivedTitle = id
            }else{
                dest.receivedTitle = "No ID"
            }
            if let name = nameField.text{
                dest.receivedName = name
            }else{
                dest.receivedName = "No Name"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.layer.cornerRadius = 10
        nameField.clipsToBounds = true
        nameField.layer.borderWidth = 1
//        nameField.layer.borderColor = UIColor.red.cgColor
        
        statusLabel.layer.cornerRadius = 10
        statusLabel.clipsToBounds = true
        statusLabel.layer.borderWidth = 1
        
    }


}

