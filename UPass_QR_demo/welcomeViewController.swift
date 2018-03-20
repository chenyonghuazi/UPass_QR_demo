//
//  welcomeViewController.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/1/2.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class welcomeViewController: UIViewController {

    var newtimer: Timer?
    var count:Int?
    
    override func viewDidLoad() {
        count = 3
        super.viewDidLoad()
        
        let image = #imageLiteral(resourceName: "welcomeScreen")
        let backgroundImage = UIImageView(image: image)
        backgroundImage.frame = self.view.layer.bounds
        backgroundImage.contentMode = .scaleAspectFit
        self.view.addSubview(backgroundImage)
        newtimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        count = 3
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        count = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func countTime(){
        if count! > 0{
            count! -= 1
        }
        else{
            newtimer?.invalidate()
            jumpToVC()
        }
    }
    
    func jumpToVC(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let destVC = story.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(destVC, animated: true, completion: nil)
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

extension ViewController{
    func setNav(){
        let nav = UINavigationController()
        self.view.window?.rootViewController = nav
    }
}
