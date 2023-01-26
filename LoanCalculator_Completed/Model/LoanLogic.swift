//
//  LoanLogic.swift
//  LoanCalculator_Completed
//

import Foundation

struct LoanLogic {
    var monthlySwitch = true
    var roundedAmount : Int = 10000
    var roundedYears : Int = 3
    var roundedInterest : Float = 2.0
    var numberOfPayments : Int = 36
    
    mutating func setSwitch(_ switchValue: Bool) {
        if switchValue {
            monthlySwitch = true
        } else {
            monthlySwitch = false
        }
    }
    
    mutating func getAmount(_ amount: Float) -> Int {
        roundedAmount = Int(amount / 1000) * 1000
        return roundedAmount
    }
    
    mutating func getYears(_ years: Float) -> Int {
        roundedYears = Int(years)
        return roundedYears
    }
    
    mutating func getInterest(_ interest: Float) -> Float {
        roundedInterest = Float(String(format: "%.1f", interest))!
        return roundedInterest
    }
    
    mutating func calculateLoanAmount() -> String {
        // formula source: https://www.fortpittcapital.com/resources/calculators/loan-calculator/
        // confirm results: https://www.loancalculator.org/
        
        var interestRate = roundedInterest / 100
        if monthlySwitch {
            numberOfPayments = roundedYears * 12
            interestRate /= 12
        } else {
            numberOfPayments = roundedYears
        }
        
        let fractionPrePower = 1 + interestRate
        let fractionPower = pow(fractionPrePower, Float(numberOfPayments))
        let formulaBottom = fractionPower - 1
        let formulaTop = interestRate * fractionPower
        let formulaFraction = formulaTop / formulaBottom
        let pmtAmount: Float = Float(roundedAmount) * formulaFraction
        return String(round(pmtAmount * 100) / 100.0)
    }
}
