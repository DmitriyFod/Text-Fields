//
//  ViewController.swift
//  Text Fields!
//
//  Created by Admin on 24.04.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var secondTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var fourthTxtField: UITextField!
    @IBOutlet weak var fifthTxtField: UITextField!
    @IBOutlet weak var currentNumberOfChars: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTxtField.delegate = self
        secondTxtField.delegate = self
        thirdTxtField.delegate = self
        fourthTxtField.delegate = self
        fifthTxtField.delegate = self
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        var informationLabel = UILabel()
        informationLabel.frame = CGRect(x: 0, y: 0, width: 138, height: 88)
        informationLabel.backgroundColor = .white
        self.progressBar.setProgress(0, animated: true)
        
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
            guard let url = URL(string: urlLink) else {return true}
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                UIApplication.shared.open(url)
            }
        }else if textField == fifthTxtField {
                guard let fifthText = fifthTxtField.text else {return false}
                    if fifthText.count < 8
                    {
                        print( "Password must be at least 8 characters")
                    }
                    if containsDigit(fifthText)
                    {
                        print( "Password must contain at least 1 digit")
                    }
                    if containsLowerCase(fifthText)
                    {
                        print( "Password must contain at least 1 lowercase character")
                    }
                    if containsUpperCase(fifthText)
                    {
                        print( "Password must contain at least 1 uppercase character")
                        
                    }
                func containsDigit(_ value: String) -> Bool
                {
                    let reqularExpression = ".*[0-9]+.*"
                    let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
                    return !predicate.evaluate(with: value)
                }
                
                func containsLowerCase(_ value: String) -> Bool
                {
                    let reqularExpression = ".*[a-z]+.*"
                    let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
                    return !predicate.evaluate(with: value)
                }
                
                func containsUpperCase(_ value: String) -> Bool
                {
                    let reqularExpression = ".*[A-Z]+.*"
                    let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
                    return !predicate.evaluate(with: value)
                }

        }
        return true
    }
}
