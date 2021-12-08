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
    
    var imageList : [UIImageView] = []
    var player1 = true
    var gameOver = false
    var draw = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageList = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
        
        
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        
        // let pos = sender.view.tag
        
        if !gameOver {
            if let imageView = sender.view as? UIImageView {
                if imageView.image == nil{
                    if player1  {
                        imageView.image = UIImage(named: "kryss")
                        winner()
                        changePlayer()
                        // ai()
                    } else {
                        imageView.image = UIImage(named: "ring")
                        winner()
                        changePlayer()
                    }
                }
            }
        }
    }
    
    func changePlayer (){
        player1.toggle()
    }
    
    func isDraw() -> Bool {
        for image in imageList{
            if image.image == nil{
                return false
            }
        }
        return true
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
        } else if isDraw() == true {
            draw.toggle()
        }
        
        segueTowin()
    }
    
    func segueTowin(){
        if gameOver || draw {
            performSegue(withIdentifier: segueToWinVC, sender: self)
            resetBoard()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWinVC {
            let destinationVC = segue.destination as! WinViewController
            if draw {
                destinationVC.receivedWinner = "draw"
            }
            else if player1 && !draw {
                destinationVC.receivedWinner = "X wins"
            } else if !player1 && !draw  {
                destinationVC.receivedWinner = "O wins"
            }
        }
    }
    
    func resetBoard() {
        imageList = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [self]  in
            for image in imageList{
                image.image = UIImage?(nil)
                gameOver = false
                player1 = true
                draw = false
            }
        })
    }
    
    
    //    func ai() {
    //
    //        if !player1 {
    //            var randomInt = Int.random(in: 0...imageList.count-1)
    //            var randomImage = imageList[randomInt]
    //
    //            if randomImage.image == nil {
    //                randomImage.image = UIImage(named: "ring")
    //            } else if randomImage.image != nil{
    //                randomInt = Int.random(in: 0...imageList.count-1)
    //                randomImage = imageList[randomInt]
    //            }
    //            player1.toggle()
    //
    //
    //        }
    //    }
    
}
