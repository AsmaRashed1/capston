//
//  Letters.swift
//  KidsApp
//
//  Created by Asma Rasheed on 21/12/2021.
//

import UIKit
import AVFoundation
class Letters: UIViewController {

    var audioPlayer = AVAudioPlayer()
    let AudioX = ["A", "B", "C", "D", "E", "F", "G","H","I", "J", "K", "L", "M", "N", "O", "P","Q", "R", "S", "T", "U", "V", "W", "X","Y","Z"]
    
    
    @IBOutlet var Letter: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LetterPrees(_ sender: UIButton) {
        play(note: Letter.firstIndex(of: sender)! + 1 )
    }
    
    func play(note: Int) {
        print(note,AudioX[note - 1])
        let Au = AudioX[note - 1]
        if let path = Bundle.main.path(forResource: Au, ofType: "wav") {
            let url = URL(fileURLWithPath: path)
            print(Au)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
            }catch {
                print(error)
            }
        }
    }
}
