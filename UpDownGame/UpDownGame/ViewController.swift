//
//  ViewController.swift
//  UpDownGame
//
//  Created by crystal on 2022/12/10.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(UIImage(imageLiteralResourceName: "slider_thumb"), for: .normal)
       reset()
    }
    
    @IBAction func sliderValueChanged (_ sender : UISlider){
        let sliderValue = Int(sender.value)
        print("Slider: \(sender.value)")
        sliderValueLabel.text = String(sliderValue)
        minimumValueLabel.text = String(Int(sender.minimumValue))
        maximumValueLabel.text = String(Int(sender.maximumValue))
    }
    
    @IBAction func touchUpHitButton (_ sender : UIButton){
        print("Slider: \(Int(slider.value))")
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "You HIT~~!")
        } else if tryCount >= 5 {
            showAlert(message: "You lose~~!")
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton (_ sender : UIButton){
        reset()
        
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30)
        print("randomValue: \(randomValue)")
        setTryCount(count: 0)
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        sliderValueChanged(slider)
    }
    
    func setTryCount(count: Int) {
        tryCount = count
        tryCountLabel.text = "\(count) / 5"
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK!", style: .default) { action in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

 
