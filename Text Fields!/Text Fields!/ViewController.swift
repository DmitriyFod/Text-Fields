//
//  ViewController.swift
//  Text Fields!
//
//  Created by Admin on 24.04.2022.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var secondTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var fourthTxtField: UITextField!
    @IBOutlet weak var fifthTxtField: UITextField!
    @IBOutlet weak var currentNumberOfChars: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTxtField.delegate = self
        secondTxtField.delegate = self
        thirdTxtField.delegate = self
        
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
            return updateValue.count - 1 < 10
        }else if textField == thirdTxtField {
            
        }
        return true
    }
    
}
