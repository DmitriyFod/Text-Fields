//
//  ViewController.swift
//  Text Fields!
//
//  Created by Admin on 24.04.2022.
//

import UIKit
import WebKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var secondTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var fourthTxtField: UITextField!
    @IBOutlet weak var fifthTxtField: UITextField!
    @IBOutlet weak var currentNumberOfChars: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstValidationLabel: UILabel!
    @IBOutlet weak var secondValidationLabel: UILabel!
    @IBOutlet weak var thirdValidationLabel: UILabel!
    @IBOutlet weak var fourthValidationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTxtField.delegate = self
        secondTxtField.delegate = self
        thirdTxtField.delegate = self
        fourthTxtField.delegate = self
        fifthTxtField.delegate = self
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        self.progressBar.setProgress(0, animated: true)
        self.firstValidationLabel.text = "- minimum of 8 characters."
        self.secondValidationLabel.text = "- minimum 1 digit."
        self.thirdValidationLabel.text = "- minimum 1 lowercased."
        self.fourthValidationLabel.text = "- minimum 1 uppercased."
    }
    @objc func urlOpen(textField: UITextField) -> Bool{
        let urlLink = fourthTxtField.text
        
        guard let urlLink = urlLink else {
            return false
        }
        guard let url = URL(string: urlLink) else {return false}
        UIApplication.shared.open(url)
        return true
    }
    //MARK:- UITextFieldDelegate
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)->Bool {
        if textField == firstTxtField {
            let setOfLetters = CharacterSet (charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
            let typedCharacterSet = CharacterSet(charactersIn: string)
            return setOfLetters.isSuperset(of: typedCharacterSet)
        }else if textField == secondTxtField {
            let currentText = secondTxtField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else {
                return false
            }//RANGE
            let updateValue = currentText.replacingCharacters(in: stringRange, with: string)//
            currentNumberOfChars.text = "\(10 - updateValue.count)"
            if updateValue.count > 10 {
                secondTxtField.layer.borderWidth = 1.0
                secondTxtField.layer.cornerRadius = 8.0
                secondTxtField.layer.borderColor = UIColor.red.cgColor
                secondTxtField.textColor = UIColor.red
                currentNumberOfChars.textColor = UIColor.red
            }else {
                secondTxtField.layer.borderColor = UIColor.black.cgColor
                secondTxtField.textColor = UIColor.black
                currentNumberOfChars.textColor = UIColor.black
            }
            return updateValue.count < 100
        }else if textField == thirdTxtField {
            guard let thirdText = thirdTxtField.text else {return false}
            let setOfLetters = CharacterSet (charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ -")
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let allowedNumbers = CharacterSet (charactersIn: "+1234567890")
            if thirdText.contains("-") {
                return allowedNumbers.isSuperset(of: typedCharacterSet)
            }
            for ch in thirdText {
                if ch != "-" {
                    return setOfLetters.isSuperset(of: typedCharacterSet)
                }
            }
        }else if textField == fourthTxtField {
            
            let urlLink = fourthTxtField.text
            
            guard let urlLink = urlLink else {
                return false
            }
            
            if urlLink.contains("https") {
                NSObject.cancelPreviousPerformRequests(
                    withTarget: self,
                    selector: #selector(ViewController.urlOpen),
                    object: textField)
                self.perform(
                    #selector(ViewController.urlOpen),
                    with: textField,
                    afterDelay: 4)
                return true
            }
        }else if textField == fifthTxtField {
            guard let fifthText = fifthTxtField.text else {return false}
            if fifthText.count >= 7
            {
                print( "Password must be at least 8 characters")
                firstValidationLabel.text = "✓ minimum of 8 characters."
                firstValidationLabel.textColor = UIColor.green

            }else {
                firstValidationLabel.text = "- minimum of 8 characters."
                firstValidationLabel.textColor = UIColor.black

            }
            if containsDigit(fifthText)
            {
                print( "Password must contain at least 1 digit")
                secondValidationLabel.text = "✓ minimum 1 digit."
                secondValidationLabel.textColor = UIColor.green
            }else {
                secondValidationLabel.text = "- minimum 1 digit."
                secondValidationLabel.textColor = UIColor.black
            }
            if containsLowerCase(fifthText)
            {
                print( "Password must contain at least 1 lowercase character")
                thirdValidationLabel.text = "✓ minimum 1 lowercase."
                thirdValidationLabel.textColor = UIColor.green
            }else {
                thirdValidationLabel.text = "- minimum 1 lowercase."
                thirdValidationLabel.textColor = UIColor.black
            }
            if containsUpperCase(fifthText)
            {
                print( "Password must contain at least 1 uppercase character")
                fourthValidationLabel.text = "✓ minimum 1 uppercase."
                fourthValidationLabel.textColor = UIColor.green
            }else {
                fourthValidationLabel.text = "- minimum 1 uppercase."
                fourthValidationLabel.textColor = UIColor.black
            }
            func containsDigit(_ value: String) -> Bool
            {
                let reqularExpression = ".*[0-9]+.*"
                let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
                return predicate.evaluate(with: value)
            }
            
            func containsLowerCase(_ value: String) -> Bool
            {
                let reqularExpression = ".*[a-z]+.*"
                let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
                return predicate.evaluate(with: value)
            }
            
            func containsUpperCase(_ value: String) -> Bool
            {
                let reqularExpression = ".*[A-Z]+.*"
                let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
                return predicate.evaluate(with: value)
            }
            
        }
        return true
    }
}
