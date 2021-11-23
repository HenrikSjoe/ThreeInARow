//
//  ViewController.swift
//  ThreeInARow
//
//  Created by Henrik Sjögren on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var image9: UIImageView!
    
    var player1 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
        
            //if canPut {
            if player1 {
            
            imageView.image = UIImage(named: "kryss")
        } else {
            imageView.image = UIImage(named: "ring")
        }
        changePlayer()
                //canPut.toggle()
            //}
            
        }
    }
    
    func changePlayer (){
            player1.toggle()
        }
    
}

