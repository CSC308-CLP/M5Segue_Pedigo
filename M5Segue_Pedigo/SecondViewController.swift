//
//  SecondViewController.swift
//  M5Segue_Pedigo
//
//  Created by Pedigo, Charles L. on 2/19/26.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    var receivedTitle: String = "Second Page"
    var receivedName: String = "Unknown"
    
    @IBAction func imageButton(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "background.jpg")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = receivedTitle
        nameLabel.text = receivedName
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
