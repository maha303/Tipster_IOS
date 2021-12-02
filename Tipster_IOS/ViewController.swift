//
//  ViewController.swift
//  Tipster_IOS
//
//  Created by Maha saad on 27/04/1443 AH.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var groupLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var groupSlider: UISlider!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipTotalLabel:UILabel!
    
    @IBOutlet weak var plusFiveLabel: UILabel!
    
    @IBOutlet weak var plusFiveTipLabel: UILabel!
    
    @IBOutlet weak var plusFiveTotalLabel: UILabel!
    
    @IBOutlet weak var plusTenLabel: UILabel!
    
    @IBOutlet weak var plusTenTipLabel: UILabel!
    
    @IBOutlet weak var plusTenTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipSlider.value = 5
        groupSlider.value = 1
        
        totalLabel.text = ""
        
        groupLabel.text = "GroupSize:\(Int(groupSlider.value))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
       switch sender.titleLabel?.text {
       case "C":
           totalLabel.text = ""
           evaluate()
           break
       case "0":
           if(totalLabel.text == "0"){return}
           totalLabel.text? += "0"
           evaluate()
           break
       case ".":
           if(totalLabel.text!.contains(".")) {return}
           totalLabel.text? += "."
           evaluate()
           break
       case "1":
           totalLabel.text? += "1"
           evaluate()
           break
       case "2":
           totalLabel.text? += "2"
           evaluate()
           break
       case "3":
           totalLabel.text? += "3"
           evaluate()
           break
       case "4":
           totalLabel.text? += "4"
           evaluate()
           break
       case "5":
           totalLabel.text? += "5"
           evaluate()
           break
       case "6":
           totalLabel.text? += "6"
           evaluate()
           break
       case "7":
           totalLabel.text? += "7"
           evaluate()
           break
       case "8":
           totalLabel.text? += "8"
           evaluate()
           break
       case "9":
           totalLabel.text? += "9"
           evaluate()
           break
       default:
           return
        }
    }
    
    func evaluate(){
        let totalAmount = Float(totalLabel.text ?? "0")!
        let tip = Float((tipPercentLabel.text?.split(separator: "%")[0])!)! / 100
        let fiveTip = Float((plusFiveLabel.text?.split(separator: "%")[0])!)! / 100
        let tenTip = Float((plusTenLabel.text?.split(separator: "%")[0])!)! / 100
        let groupNumber = Float((groupLabel.text?.split(separator: ":")[1])!)!
        
        tipLabel.text = String(format: "%.2f", (totalAmount * tip / groupNumber))
        plusFiveTipLabel.text = String(format: "%.2f", (totalAmount * fiveTip / groupNumber))
        plusTenTipLabel.text = String(format: "%.2f", (totalAmount * tenTip / groupNumber))
        
        tipTotalLabel.text = String(format: "%.2f", (totalAmount * tip + totalAmount) / groupNumber)
        plusFiveTotalLabel.text = String(format: "%.2f", (totalAmount * tip + totalAmount) / groupNumber )
        plusTenTotalLabel.text = String(format: "%.2f", (totalAmount * tip) + totalAmount / groupNumber )
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        tipPercentLabel.text = "\(Int(sender.value))%"
        plusFiveLabel.text = "\(Int(sender.value) + 5)%"
        plusTenLabel.text = "\(Int(sender.value) + 10)%"
        
        evaluate()
        
        
    }
    
    @IBAction func groupChanged(_ sender: UISlider) {
        groupLabel.text = "GroupSize:\(Int(sender.value))"
        evaluate()
    }
    
}

