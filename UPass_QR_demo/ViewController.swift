//
//  ViewController.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/1/1.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var filer: CIFilter?
    var textBundle:String = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func createQR(_ sender: UIButton) {
        if firstNameTextField.text != "" && lastNameTextField.text != ""
            && emailTextField.text != "" && phoneTextField.text != ""{
//            var dataDictionary = [String:String]()
//            dataDictionary["firstName"] = firstNameTextField.text
//            dataDictionary["lastName"] = lastNameTextField.text
//            dataDictionary["email"] = emailTextField.text
//            dataDictionary["phoneNumber"] = phoneTextField.text
            
            textBundle = ""
            textBundle = textBundle + firstNameTextField.text!
            textBundle = textBundle + lastNameTextField.text!
            textBundle = textBundle + emailTextField.text!
            textBundle = String(textBundle + phoneTextField.text!)
            let data = textBundle.data(using: .ascii, allowLossyConversion: false)
            
            filer = CIFilter(name: "CIQRCodeGenerator")
            
            filer?.setValue(data, forKey: "inputMessage")
            
            transforSegue(text: textBundle)
    }
        
        
    
}
    func transforSegue(text:String){
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let destVC = story.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        
        
        destVC.textBundle = text
//        destVC.setQRImage()
        present(destVC, animated: true) {
            destVC.setQRImage()
        }
    }

}
