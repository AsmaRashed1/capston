//
//  Drawing.swift
//  KidsApp
//
//  Created by Asma Rasheed on 20/12/2021.
//

import UIKit
import PencilKit
class Drawing: UIViewController {

    @IBOutlet weak var litter: UILabel!
    
    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    
    @IBOutlet weak var ViewX: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewX.clipsToBounds = true
        ViewX.isMultipleTouchEnabled = false
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: ViewX){
            startPoint = point
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: ViewX){
            touchPoint = point
        }
        
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        
        startPoint = touchPoint
        
        drwo()
    }
    
    
    func drwo(){
        let drwoing = CAShapeLayer()
        drwoing.fillColor = nil
        drwoing.lineWidth = 5
        drwoing.strokeColor = UIColor.black.cgColor
        drwoing.path = path.cgPath
        ViewX.layer.addSublayer(drwoing)
        ViewX.setNeedsDisplay()
    }
    
    @IBAction func clear(_ sender: Any) {
        path.removeAllPoints()
        ViewX.layer.sublayers = nil
        ViewX.setNeedsDisplay()
    }
    
    
    @IBAction func next(_ sender: Any) {
        print("B\(String(describing: litter))")
    }
    
    @IBAction func back(_ sender: Any) {
    }
    
    
}
