//
//  WelcomeViewController.swift
//  ThreeInARow
//
//  Created by Henrik Sjögren on 2021-12-08.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let startGameVC = "toGameSegue"
   
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1Text: UITextField!
    @IBOutlet weak var player2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    

    @IBAction func startGameButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: startGameVC, sender: self)
    }
    
//    func go (){
//        performSegue(withIdentifier: startGameVC, sender: self)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == startGameVC {
            let destinationVC = segue.destination as! ViewController
            destinationVC.p1 = player1Text.text ?? ""
            destinationVC.p2 = player2Text.text ?? ""
        }
    }
}



