//
//  webV.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/2/17.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class webV: UIViewController,UIWebViewDelegate {
    @IBAction func load(_ sender: UIBarButtonItem) {
        myWebView!.loadRequest(URLRequest(url: URL(string: "https://portal.utoronto.ca/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_1_1")!))
    }
    
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    @IBOutlet weak var myWebView: UIWebView!
    var utorid:String?
    var password:String?
    var url:URL?
    override func viewDidLoad() {
        super.viewDidLoad()
//        myWebView.translatesAutoresizingMaskIntoConstraints = false
//        myWebView.topAnchor.constraint(equalTo: view.topAnchor)
        // Do any additional setup after loading the view.
        guard let url = url else{ return }
        myWebView.loadRequest(URLRequest(url: url))
        myWebView.delegate = self
    }

    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let scriptString =  "document.getElementById('query').submit();"
        let filluserid = "document.getElementById('inputID').value='\(utorid!)';"
        let fillpassword = "document.getElementById('inputPassword').value='\(password!)';"
        //        let scriptString =  String(format:"document.forms[0].submit();")
        //        let filluserid = "document.getElementById('username').value='\(utorid.text!)';"
        //        let fillpassword = "document.getElementById('password').value='\(password.text!)';"
//        DispatchQueue.main.async {
            webView.stringByEvaluatingJavaScript(from: filluserid)
            webView.stringByEvaluatingJavaScript(from: fillpassword)
            webView.stringByEvaluatingJavaScript(from: scriptString)
//                let myTimer : Timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.handleReload), userInfo: nil, repeats: false)
            
            
//        }
//        webView.stringByEvaluatingJavaScript(from: scriptString)
//        let myTimer : Timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(self.handleReload), userInfo: nil, repeats: false)
    }
    
//    @objc func handleReload(){
//        myWebView.reload()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
