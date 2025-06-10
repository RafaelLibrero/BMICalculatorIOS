//
//  ViewController.swift
//  BMICalculator
//
//  Created by Tardes on 6/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weight: Float = 70.0
    var height: Float = 170.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onWeightChanged(_ sender: UIStepper) {
        weight = Float(sender.value)
        weightLabel.text = "\(Int(weight)) kg"
    }
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
        height = sender.value
        heightLabel.text = "\(Int(height)) cm"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let heighInMeter: Float = height / Float(100)
        let bmi: Float = weight / pow(heighInMeter, 2)
        resultLabel.text = String(format: "%.2f", bmi)
        
        var color = UIColor.black
        var showAlert = false
        
        switch bmi {
        case ..<18.5:
            descriptionLabel.text = "Underweight"
            color = UIColor.bmiUnderweight
        case 18.5..<25:
            descriptionLabel.text = "Normal weight"
            color = UIColor.bmiNormalWeight
        case 25..<30:
            descriptionLabel.text = "Overweight"
            color = UIColor.bmiOverweight
        case 30..<35:
            descriptionLabel.text = "Obese"
            color = UIColor.bmiObesity
            showAlert = true
        default:
            descriptionLabel.text = "Extreme obesity"
            color = UIColor.bmiExtremeObesity
            showAlert = true
        }
        
        resultLabel.textColor = color
        descriptionLabel.textColor = color
        
        if showAlert {
            let alert = UIAlertController(
                title: "Riesgo de salud",
                message: "Tu peso actual pone en grave riesgo tu vida. Busca ayuda médica cuanto antes.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Mas información", style: .default, handler: { action in
                // He pulsado mas información
                let adviceSiteUrl = "https://medlineplus.gov/spanish/ency/patientinstructions/000348.htm"
                if let url = URL(string: adviceSiteUrl), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }))
            alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

