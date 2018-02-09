//
//  loginVC.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/2/8.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class loginVC: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var utorid: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func login(_ sender: UIButton) {
        let parameters = ["user":utorid.text,"pass":password.text]
        
        let url = URL(string: "https://weblogin.utoronto.ca")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            let json = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = json
        }catch{
            
        }
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print(error)
            }else if let response = response{
                print(response)
            }
            print("data:")
            print(data)
            
        }.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
