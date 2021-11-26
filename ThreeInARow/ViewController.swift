//
//  ViewController.swift
//  ThreeInARow
//
//  Created by Henrik Sjögren on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let segueToWinVC = "segueToWin"
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var image9: UIImageView!
    
//    let imagelist = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
    
    var player1 = true
    var gameOver = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let imagelist = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
//
//
//        for image in imagelist{
//            image?.image = UIImage(named: "tom")
//        }
//
//        for image in imagelist{
//            image?.image = UIImage?(nil)
//        }

        // Do any additional setup after loading the view.
        
        
       
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        
        if !gameOver {
            if let imageView = sender.view as? UIImageView {
                
                if imageView.image == nil{
                    if player1  {
                        imageView.image = UIImage(named: "kryss")
                        winner()
                        changePlayer()
                        
                    } else {
                        imageView.image = UIImage(named: "ring")
                        winner()
                        changePlayer()
                        
                        }
                    }
                }
            //win()
            }
        }
    
    func changePlayer (){
            player1.toggle()
        }
    
    func winner (){
        if image1.image == image2.image && image1.image == image3.image && image1.image != nil{
            gameOver.toggle()
        } else if  image4.image == image5.image && image4.image == image6.image && image4.image != nil{
            gameOver.toggle()
        } else if  image7.image == image8.image && image7.image == image9.image && image7.image != nil{
            gameOver.toggle()
        } else if  image1.image == image5.image && image1.image == image9.image && image1.image != nil{
            gameOver.toggle()
        } else if  image3.image == image5.image && image3.image == image7.image && image3.image != nil{
            gameOver.toggle()
        } else if  image1.image == image4.image && image1.image == image7.image && image1.image != nil{
            gameOver.toggle()
        } else if  image2.image == image5.image && image2.image == image8.image && image2.image != nil{
            gameOver.toggle()
        } else if  image3.image == image6.image && image3.image == image9.image && image3.image != nil{
            gameOver.toggle()
        }
        segueTowin()
    }
    
    func segueTowin(){
        if gameOver{
            performSegue(withIdentifier: segueToWinVC, sender: self)
            resetBoard()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWinVC {
            let destinationVC = segue.destination as! WinViewController
            if player1{
            destinationVC.receivedWinner = "X wins"
            } else {
                destinationVC.receivedWinner = "O wins"
            }
        }
    }
    
    func resetBoard() {
        let imagelist = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
        for image in imagelist{
            image?.image = UIImage?(nil)
            gameOver.toggle()
            if player1 {player1.toggle()}
        }
    }
    
}

