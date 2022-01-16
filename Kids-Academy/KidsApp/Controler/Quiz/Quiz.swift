//
//  Quiz.swift
//  KidsApp
//
//  Created by Asma Rasheed on 23/12/2021.
//

import UIKit



class Quiz: UIViewController {
    
    @IBOutlet weak var QLable: UILabel!
    
    @IBOutlet var Button: [UIButton]!
    
    
    
    var Questions = [Question]()
    var QNumber = Int()
    var AnserNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Questions = [Question(Question: "2 + 7", Ansers: ["10","9","8","7"], Anser: 1),
                     Question(Question: "4 + 3", Ansers: ["7","6","9","8"], Anser: 0),
                     Question(Question: "7 + 8", Ansers: ["10","11","15","3"], Anser: 2),
                     Question(Question: "10 + 1", Ansers: ["10","11","15","13"], Anser: 1),
                     Question(Question: "The Quiz is Done", Ansers: ["Done","Done","Done","Done"], Anser: 4)]
        
        redomeQuestion()
    }
    
    
    
    
    func redomeQuestion(){
        if Questions.count > 0{
            QNumber = 0
            QLable.text = Questions[QNumber].Question
            AnserNumber = Questions[QNumber].Anser
            for i in 0..<Button.count{
                Button[i].setTitle(Questions[QNumber].Ansers[i], for: UIControl.State.normal)
            }
            Questions.remove(at: QNumber)
        }
        else{
            NSLog("done")
        }
    }
    
    
    
    
    
    
    @IBAction func B1(_ sender: Any) {
        if AnserNumber == 0{
            redomeQuestion()
        }else{
            NSLog("rpng")
        }
    }
    
    @IBAction func B2(_ sender: Any) {
        if AnserNumber == 1{
            redomeQuestion()
        }else{
            NSLog("rpng")
        }
    }
    
    @IBAction func B3(_ sender: Any) {
        if AnserNumber == 2{
            redomeQuestion()
        }else{
            NSLog("rpng")
        }
    }
    
    @IBAction func B4(_ sender: Any) {
        if AnserNumber == 3{
            redomeQuestion()
        }else{
            NSLog("rpng")
        }
    }
    
    
}
