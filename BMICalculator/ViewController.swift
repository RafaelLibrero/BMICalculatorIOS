//
//  ViewController.swift
//  BMICalculator
//
//  Created by Tardes on 6/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightlabel: UILabel!
    @IBOutlet weak var heightlabel: UILabel!
    @IBOutlet weak var resultlabel: UILabel!
    
    var weight: Float = 0
    var height: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onWeightChanged(_ sender: UIStepper) {
        weight = Float(sender.value)
        weightlabel.text = "\(Int(weight)) kg"
    }
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
        height = sender.value
        heightlabel.text = "\(Int(height)) cm"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let heighInMeter: Float = height / Float(100)
        let bmi: Float = weight / pow(heighInMeter, 2)
        resultlabel.text = String(format: "%.2f", bmi)
    }
}

