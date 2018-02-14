//
//  loginVC.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/2/8.
//  Copyright © 2018年 Edwin. All rights reserved.
//
import WebKit
import UIKit

class loginVC: UIViewController,UITextFieldDelegate,UIWebViewDelegate{
    @IBOutlet weak var utorid: UITextField!
    
    @IBOutlet weak var password: UITextField!
    let htmlContent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let url = URL(string:"https://weblogin.utoronto.ca")
//        let session = URLSession.shared
//        session.dataTask(with: url!) { (data, response, error) in
//            if error != nil{
//                print(error!)
//            }else if let data = data{
//                do{
//                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                        print(json)
//                }catch{
//
//                }
//
//            }
//        }
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func setUpWK(){
        let webkit = UIWebView(frame: view.frame)
        webkit.backgroundColor = UIColor.blue
        webkit.delegate = self
        view.addSubview(webkit)
        
        let url = URL(string:"https://weblogin.utoronto.ca/")!
        let request = URLRequest(url: url)
        webkit.loadRequest(URLRequest(url: URL(string: "https://weblogin.utoronto.ca/")!))
        
        //webkit.load(request)
//        javascriptFunc(web: webkit)
        
        view.bringSubview(toFront: webkit)
    }
    
   
    func webViewDidFinishLoad(_ webView: UIWebView) {
        javascriptFunc(web: webView)
    }
    
    func javascriptFunc(web:UIWebView){
//        var scriptString = "<script language=\"javascript\">"
        let scriptString =  "document.getElementById('query').submit();"
        let filluserid = "document.getElementById('inputID').value='\(utorid.text!)';"
        let fillpassword = "document.getElementById('inputPassword').value='\(password.text!)';"
        
        DispatchQueue.main.async {
            web.stringByEvaluatingJavaScript(from: filluserid)
            web.stringByEvaluatingJavaScript(from: fillpassword)
            web.stringByEvaluatingJavaScript(from: scriptString)
        }
        
        
//        web.evaluateJavaScript(filluserid, completionHandler: {(any,error) in
//            if let error = error{
//                print(error)
//            }
//        })
//        web.evaluateJavaScript(fillpassword, completionHandler: {(any,error) in
//            if let error = error{
//                print(error)
//            }
//        })
//        web.evaluateJavaScript(scriptString, completionHandler: {(any,error) in
//            if let error = error{
//                print(error)
//            }
//        })
    }
    @IBAction func login(_ sender: UIButton) {
        if (utorid.text != "" && utorid.text != nil){
            if (password.text != "" && password.text != nil){
                setUpWK()
                view.endEditing(true)
            }
        }
        else{
            print("something wrong")
        }
//        let parameters = ["inputID":"chenyo21","inputPassword":"Qq800023"]
//
//        let url = URL(string: "https://weblogin.utoronto.ca")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        do{
//            let json = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            request.httpBody = json
//        }catch{
//
//        }
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            if let error = error{
//                print(error)
//            }else if let response = response{
//
////                response.allHeaderFields
//                print(response)
//            }else if let data = data{
//                let htmlContent = String(data:data,encoding: .utf8)
//                print(htmlContent)
//            }
//            print("data:")
//            print(data)
//
//        }.resume()
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
