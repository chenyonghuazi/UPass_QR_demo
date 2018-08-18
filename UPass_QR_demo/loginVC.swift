//
//  loginVC.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/2/8.
//  Copyright © 2018年 Edwin. All rights reserved.
//
import WebKit
import UIKit

class loginVC: UIViewController,UITextFieldDelegate,UIWebViewDelegate,WKNavigationDelegate{
    @IBOutlet weak var utorid: UITextField!
    var myweb:UIWebView?
    @IBOutlet weak var password: UITextField!
//    let htmlContent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setNav()

        guard let url = URL(string:"https://baidu.com") else{ return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "PO"
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
//            print("??")
//            print(data)
            if error != nil{
                print(error!)
                print(data)
            }else if let data = data{
                
//                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    let htmlContent = String(data:data,encoding: .utf8)
//                    print(htmlContent)
//                    print(json)
                
                
            }
        }.resume()
//        session.dataTask(with: url) { (data, response, error) in
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
//         Do any additional setup after loading the view.
        
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
//        let webkit = WKWebView(frame: view.frame)
        myweb = webkit
        webkit.backgroundColor = UIColor.blue
        webkit.delegate = self
//        webkit.navigationDelegate = self
//        let nav = UINavigationController(rootViewController: )
        view.addSubview(webkit)
        
        let url = URL(string:"https://acorn.utoronto.ca/")!
        let request = URLRequest(url: url)
//        https://portal.utoronto.ca/webapps/login?action=relogin
        webkit.loadRequest(URLRequest(url: URL(string: "https://portal.utoronto.ca/webapps/login?action=relogin")!))
//        webkit.loadRequest(URLRequest(url: URL(string: "https://weblogin.utoronto.ca/")!))
//        webkit.loadRequest(URLRequest(url: URL(string: "https://acorn.utoronto.ca/")!))
//        webkit.load(request)
//        javascriptFunc(web: webkit)
        
        view.bringSubview(toFront: webkit)
    }
    
   
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        let url = webView.request?.url
//        javascriptFunc(web: webView)
//        if webView.request?.url
//
//    }
    

//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        let scriptString =  String(format:"document.forms[0].submit();")
//        let filluserid = String(format:"document.getElementById('username').value='\(utorid.text!)';")
//        let fillpassword = String(format:"document.getElementById('password').value='\(password.text!)';")
//        print("success!")
////        webView.wk
//        DispatchQueue.main.async{
//        webView.evaluateJavaScript(filluserid, completionHandler: nil)
//        webView.evaluateJavaScript(fillpassword) { (nil, error) in
//            if error == nil{
//                print("2222")
//                webView.evaluateJavaScript(scriptString, completionHandler: nil)
//                print(webView.isLoading)
//            }
//        }
//        }
//    }
    
    
    func javascriptFunc(web:UIWebView){
//        var scriptString = "<script language=\"javascript\">"
//        let scriptString =  "document.getElementById('query').submit();"
//        let filluserid = "document.getElementById('inputID').value='\(utorid.text!)';"
//        let fillpassword = "document.getElementById('inputPassword').value='\(password.text!)';"
        let scriptString =  String(format:"document.forms[0].submit();")
        let filluserid = "document.getElementById('username').value='\(utorid.text!)';"
        let fillpassword = "document.getElementById('password').value='\(password.text!)';"
        DispatchQueue.main.async {
            web.stringByEvaluatingJavaScript(from: filluserid)
            web.stringByEvaluatingJavaScript(from: fillpassword)
            
            }
        web.stringByEvaluatingJavaScript(from: scriptString)

    }
    @IBAction func login(_ sender: UIButton) {
        if (utorid.text != "" && utorid.text != nil){
            if (password.text != "" && password.text != nil){
                let story = UIStoryboard(name: "Main", bundle: nil)
                let destVC = story.instantiateViewController(withIdentifier: "webV") as! webV
                destVC.url = URL(string:"https://weblogin.utoronto.ca/")
                destVC.utorid = utorid.text!
                destVC.password = password.text!
                present(destVC, animated: true, completion: nil)
//                setUpWK()
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

extension loginVC{
    @objc func handleNav(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setNav(){
        
        let nav = UINavigationController(rootViewController: self)
        
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleNav))
        
//        self.view.window?.rootViewController = nav
        navigationController?.navigationBar.topAnchor.constraint(equalTo: view.topAnchor)
        navigationController?.navigationBar.heightAnchor.constraint(equalToConstant: 44)
        navigationController?.navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        navigationController?.navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        self.present(nav, animated: true, completion: nil)
    }
    
    func Completion(){
        if(!(myweb!.isLoading)){
            myweb?.loadRequest(URLRequest(url:URL(string:"https://portal.utoronto.ca/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_1_1")!))
        }
    }
}
