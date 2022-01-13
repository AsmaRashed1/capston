//
//  Number.swift
//  KidsApp
//
//  Created by Asma Rasheed on 21/12/2021.
//

import UIKit
import AVFoundation
class Number: UIViewController {

    
    
    var audioPlayer = AVAudioPlayer()
    
    
    let AudioX = ["1", "2", "3", "4", "5", "6", "7", "8","9"]
    
    
    @IBOutlet var Numbers: [UIButton]!
    
    
    @IBAction func NumberPress(_ sender: UIButton) {
        play(note: Numbers.firstIndex(of: sender)! + 1 )
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
