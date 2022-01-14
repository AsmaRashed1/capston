//
//  HomeStartViewController.swift
//  KidsApp
//
//  Created by Asma Rasheed on 11/01/2022.
//

import UIKit
import AVFoundation


class HomeStartViewController: UIViewController {
    
    
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cornerRadius(view1: btnStart, radius: 17)
        
        playVideo()
    }
    

    func cornerRadius(view1: UIView, radius: CGFloat = 10) {
        view1.layer.cornerRadius = radius
    }
    
    func showAnimation() {
        let pulse = PulseAnimation(numberOfPulse: 15, radius: 200, postion: self.view.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 0.8792765737, green: 0.5114517808, blue: 0.5431056619, alpha: 1)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "video", ofType: "mov") else {
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        
        player.play()
        
        videoLayer.bringSubviewToFront(btnStart)
        videoLayer.bringSubviewToFront(lblWelcome)
   
    }
    
    
}