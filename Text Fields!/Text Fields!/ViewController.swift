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
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTxtField.delegate = self
        //secondTxtField.delegate = self
        
    }
    //MARK:- UITextFieldDelegate
    internal func textField(_ firstTxtField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)->Bool {
        let setOfLetters = CharacterSet (charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return setOfLetters.isSuperset(of: typedCharacterSet)
        }
    
    }


