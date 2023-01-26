//
//  ViewController.swift
//  LoanCalculator_Completed
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var yearsLabel: UILabel!
    
    @IBOutlet weak var interestLabel: UILabel!
    
    var loanLogic = LoanLogic()
    var amount : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchChange(_ sender: UISwitch) {
        loanLogic.setSwitch(sender.isOn)
    }
    
    
    @IBAction func amountChange(_ sender: UISlider) {
        amountLabel.text = "Amount: \(loanLogic.getAmount(sender.value))"
    }
    
    
    @IBAction func yearsChange(_ sender: UISlider) {
        yearsLabel.text = "Years: \(loanLogic.getYears(sender.value))"

    }
    
    @IBAction func interestChange(_ sender: UISlider) {
        interestLabel.text = "Interest (%): \(loanLogic.getInterest(sender.value))"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        amount = loanLogic.calculateLoanAmount()
        self.performSegue(withIdentifier: "toLoanAmount", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLoanAmount" {
            let loanNavigation = segue.destination as! LoanAmountViewController
            loanNavigation.amount = amount
        }
    }
}

