//
//  ViewController.swift
//  myCounterProject
//
//  Created by Dmitry Kirdin on 14.05.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLogTextView: UITextView!
    
    @IBOutlet weak var incrementorButton: UIButton!
    
    @IBOutlet weak var decrementorButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var infoCounterLabel: UILabel!
    
    private var myCounter: Int = 0
    
    enum counterActions {
        case increase
        case decrease
        case reset
    }
    
    func renewCounterInfo() {
        infoCounterLabel.text = "Значение счетчика: \(myCounter)"
    }
    
    func newCounterRecord(action: counterActions) {
        //let myDateFormatter = DateFormatter()
        //myDateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let today = Date().description(with: Locale(identifier: "ru"))
        
        switch (action) {
        case .increase:
            //let today = Date()
            counterLogTextView.text += "\n[\(today)]: значение изменено на +1"
            myCounter += 1
            renewCounterInfo()
        case .decrease:
            //let today = Date()
            if myCounter == 0 {
                counterLogTextView.text += "\n[\(today)]: попытка уменьшить значение счетчика меньше 0"
            } else {
                counterLogTextView.text += "\n[\(today)]: значение изменено на -1"
                myCounter -= 1
                renewCounterInfo()
            }
        case .reset:
            //let today = Date()
            counterLogTextView.text += "\n[\(today)]: значение сброшено"
            myCounter = 0
            renewCounterInfo()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLogTextView.text = "История изменений: \n"
     
    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        newCounterRecord(action: .increase)
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        newCounterRecord(action: .decrease)
    }

    @IBAction func resetCounter(_ sender: Any) {
        newCounterRecord(action: .reset)
    }
    
    
}

