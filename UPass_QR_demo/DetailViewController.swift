//
//  DetailViewController.swift
//  UPass_QR_demo
//
//  Created by Edwin on 2018/1/1.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var Timer: UILabel!
    
    var firstNameString:String?
    var lastNameString:String?
    var emailString:String?
    var phoneString:String?
    var textBundle:String?
    var TimerString:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.firstName.text = firstNameString
//        self.lastName.text = lastNameString
//        self.email.text = emailString
//        self.phoneNum.text = phoneString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInfo(){
        let lists = textBundle!.components(separatedBy: ",")
        if lists.count == 4
        {
        self.firstNameString = lists[0]
        print("firstName:\(lists[0])")
        self.lastNameString = lists[1]
        self.emailString =  lists[2]
        self.phoneString =  lists[3]
        self.firstName.text = firstNameString
        self.lastName.text = lastNameString
        self.email.text = emailString
        self.phoneNum.text = phoneString
            let puffix = "Your code has been scanned and it only takes: "
            self.Timer.text = puffix + TimerString! + " seconds!"
        }
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
