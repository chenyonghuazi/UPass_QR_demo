//
//  QRViewController.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/1/1.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    @IBOutlet weak var QRImageView: UIImageView!
    var textBundle:String = String()
    var filter:CIFilter?
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setQRImage(){
        let data = textBundle.data(using: .ascii, allowLossyConversion: false)
        
        filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let rawImage = filter?.outputImage
        
        let transformImage = rawImage?.transformed(by: transform)
        
        let image = UIImage(ciImage: (transformImage)!)
        
        QRImageView.image = image
        
    }

}
