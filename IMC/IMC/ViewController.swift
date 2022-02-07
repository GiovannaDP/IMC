//
//  ViewController.swift
//  IMC
//
//  Created by Giovanna Danelli Pau on 07/02/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultView: UIView!
    
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IBActions
    @IBAction func calculate(_ sender: Any) {
        guard let weight = Double(weightText.text!), let height = Double(heightText.text!) else {return}
        imc = weight / (height * height)
        showResults()
    }
    
    func showResults(){
        var result: String = " "
        var image: String = " "
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        resultLabel.text = "\(Int(imc)): \(result)"
        resultImage.image = UIImage(named: image)
        resultView.isHidden = false
        view.endEditing(true)
    }
    
}

