//
//  ViewController.swift
//  ThreeInARow
//
//  Created by Henrik Sjögren on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    let segueToWinVC = "segueToWin"
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var howManyWins: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    var imageList : [UIImageView] = []
    var player1 = true
    var gameOver = false
    var draw = false
    
    var p1 = ""
    var p2 = ""
    var p1Victories = 0
    var p2Victories = 0
    var draws = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageList = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
        
        label.text = "\(p1) goes first"
        
        reset.isHidden = true
        howManyWins.isHidden = true
        
        
        
        
        
        
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        if player1 {label.text = "\(p2)'s turn"
            
        } else {label.text = "\(p1)'s turn"}
        
        // let pos = sender.view.tag
        
        if !gameOver {
            if let imageView = sender.view as? UIImageView {
                if imageView.image == nil{
                    if player1  {
                        imageView.image = UIImage(named: "kryss")
                        print("robin")
                        
                        changePlayer()
                        if !winner(){
                            ai()
                        }
                            
                        
                        
                        //changePlayer()
                        print(imageView.image)
                        //ai()
                    } else {
                        imageView.image = UIImage(named: "ring")
                        winner()
                        changePlayer()
                        
                    }
                }
            }
        }
//        print(image1.image)
//        print(image2.image)
//        print(image3.image)
//        print(image4.image)
//        print(image5.image)
//        print(image6.image)
//        print(image7.image)
//        print(image8.image)
//        print(image9.image)
        
      //  count += 1
        
    }
    
    
    @IBAction func resetBoard(_ sender: UIButton) {
        resetBoard()
        reset.isHidden = true
        howManyWins.isHidden = true
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
    
    
    func winner () -> Bool{
        var hasWon = false
        if image1.image == image2.image && image1.image == image3.image && image1.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image4.image == image5.image && image4.image == image6.image && image4.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image7.image == image8.image && image7.image == image9.image && image7.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image1.image == image5.image && image1.image == image9.image && image1.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image3.image == image5.image && image3.image == image7.image && image3.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image1.image == image4.image && image1.image == image7.image && image1.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image2.image == image5.image && image2.image == image8.image && image2.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if  image3.image == image6.image && image3.image == image9.image && image3.image != nil{
            gameOver.toggle()
            hasWon.toggle()
        } else if isDraw() == true {
            draw.toggle()
            hasWon.toggle()
        }
       
        ifGameOver()
        return hasWon
        
        // segueTowin()
        
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
                destinationVC.receivedWinner = "\(p1) wins"
            } else if !player1 && !draw  {
                destinationVC.receivedWinner = "\(p2) wins"
            }
        }
    }
    
    func resetBoard() {
        imageList = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
        // DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [self]  in
        for image in imageList{
            image.image = UIImage?(nil)
            gameOver = false
            player1 = true
            draw = false
        }
        label.text = "\(p1) goes first"
        // count = 0
        //})
        
    }
    
    
    func ai() {

        if !player1 {
            //var count = 0

            var randomInt = Int.random(in: 0...8)
            //var randomImage = imageList[randomInt]

            while imageList[randomInt].image != nil {
                randomInt = Int.random(in: 0...imageList.count-1)
                //randomImage = imageList[randomInt]
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [self]  in
                imageList[randomInt].image = UIImage(named: "ring")
                winner()
//                print(image1.image)
//                print(image2.image)
//                print(image3.image)
//                print(image4.image)
//                print(image5.image)
//                print(image6.image)
//                print(image7.image)
//                print(image8.image)
//                print(image9.image)
                player1.toggle()
            })
            //  player1.toggle()
        }
    }
    
    
    func ifGameOver () {
        
        if gameOver && player1 {
            p1Victories += 1
            label.text = "\(p1) won"
            reset.isHidden = false
            howManyWins.text = "Wins:\n\(p1): \(p1Victories)\n\(p2): \(p2Victories)\nDraws: \(draws)"
            howManyWins.isHidden = false
        } else if gameOver && !player1 {
            p2Victories += 1
            label.text = "\(p2) won"
            reset.isHidden = false
            howManyWins.text = "Wins:\n\(p1): \(p1Victories)\n\(p2): \(p2Victories)\nDraws: \(draws)"
            howManyWins.isHidden = false
        } else if draw {
            draws += 1
            label.text = "Draw"
            reset.isHidden = false
            howManyWins.text = "Wins:\n\(p1): \(p1Victories)\n\(p2): \(p2Victories)\nDraws: \(draws)"
            howManyWins.isHidden = false
        }
        
    }
}
