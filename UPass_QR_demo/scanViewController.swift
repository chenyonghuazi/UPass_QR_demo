//
//  scanViewController.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/1/1.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit
import AVFoundation

class scanViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var scanImageView: UIImageView!
    
    var startingTime:Date?
    var video = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("error1")
        
        
        let captureDevice = AVCaptureDevice.default(for: .video)
//            - input initialization to
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        
        }catch{
            print("error")
        }
        
        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        session.addOutput(output)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr,AVMetadataObject.ObjectType.pdf417,.ean13,.ean8,.pdf417]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y + navigationBar.frame.origin.y + navigationBar.frame.height, width: view.frame.width, height: view.frame.height - (navigationBar.frame.origin.y + navigationBar.frame.height))
        video.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(video)
        
        
        self.scanImageView.layer.borderWidth = 3
        self.scanImageView.layer.borderColor = UIColor.green.cgColor
        self.view.bringSubview(toFront: scanImageView)
        
        self.scanImageView.alpha = 1.0
        session.startRunning()
//        and capture func  to
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        session.stopRunning()
        if metadataObjects != [] && metadataObjects.count != 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr{
                    print("Here!!!")
                    jumpBackAndFront(object: object)
                    
                }else if let stringValue = object.stringValue{
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    handleBarCode(code: stringValue)
                }

            }else{
                print("err")
            }
        }
    }
    
    func handleBarCode(code:String){
        let alertISBN = UIAlertController(title: "Succeed scanned", message: "ISBN: " + code, preferredStyle: .alert)
        alertISBN.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in
            self.session.startRunning()
        }))
        alertISBN.addAction(UIAlertAction(title: "Search", style: .default, handler: { (action) in
            print("hi")
        }))
        present(alertISBN, animated: true, completion: nil)
    }
    
    
    
    func jumpBackAndFront(object:AVMetadataMachineReadableCodeObject){
        if !(object.stringValue?.contains(","))!{
            let alert = UIAlertController(title: "Your code is:", message: object.stringValue, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: {action in
                self.session.startRunning()
            }))
            alert.addAction(UIAlertAction(title: "copy", style: .default, handler: { (nil) in
                UIPasteboard.general.string = object.stringValue}))
            present(alert, animated: true, completion: nil)
        }
        else{
            if let lists = object.stringValue?.components(separatedBy: ","){
                if lists.count == 4{
                if lists[2].contains("@"){
                    if lists[3].count == 10 && Int(lists[3]) != nil{
                        let endingTimer = Date()
                        let story = UIStoryboard(name: "Main", bundle: nil)
                        let destVC = story.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                        destVC.textBundle = object.stringValue!
                        destVC.TimerString = String(endingTimer.timeIntervalSince(self.startingTime!))
                        self.present(destVC, animated: true, completion: {
                            destVC.setInfo()
                        })
                    }else{createAlert()}
                }else{createAlert()}
                
                }else{createAlert()}
            }
            else{
                createAlert()
            }
        }
    }

    func createAlert(){
        let alert = UIAlertController(title: "Warning", message: "Your format of the value behind QR code is invalid", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
