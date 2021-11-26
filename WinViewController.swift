//
//  WinViewController.swift
//  ThreeInARow
//
//  Created by Henrik Sjögren on 2021-11-25.
//

import UIKit

class WinViewController: UIViewController {

    var receivedWinner : String?
    
    @IBOutlet weak var whoWonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whoWonLabel.text = receivedWinner

        // Do any additional setup after loading the view.
    }
    

   

}
