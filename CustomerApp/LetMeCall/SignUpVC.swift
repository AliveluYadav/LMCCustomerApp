//
//  SignUpVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 25/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var eMailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var referralTF: UITextField!
    @IBOutlet weak var showBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions
 
    @IBAction func clickOnSignUp(_ sender: Any) {
        
        if self.firstNameTF.text?.count == 0
        {
            self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: "FirstName is Required", completion: {_ in})
        }
        else if !Validation.isValidEmail(self.eMailTF.text)
             {
            self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: "Please Enter valid Email", completion: {_ in})
            
        }
        else if !Validation.isValidPassword(self.passwordTF.text)
        {
             self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: "Password must have at least 8 characters and contains the following: Atleast one upper case letter,one number and One special character.", completion: {_ in})
        }
        else if self.zipCodeTF.text?.count == 0
        {
            self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: "ZipCode is Required", completion: {_ in})        }
        else if !((self.zipCodeTF.text?.count)! >= 4 && (self.zipCodeTF.text?.count)! <= 8)
        {
            self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: "Please Enter Valid ZipCode", completion: {_ in})        }
        else {
            
           let signUpURL = "http://45.33.46.234:8080/api//v0/login/signup"

            let parameters: [String: AnyObject] = [
                "userName": self.eMailTF!.text as AnyObject,
                "password": self.passwordTF!.text as AnyObject,
                "retypePassword": self.passwordTF!.text as AnyObject,
                "firstName" : self.firstNameTF!.text as AnyObject,
                "zipCode": self.zipCodeTF!.text as AnyObject,
//              "appNotificationId" : [AppData data].fcmToken,
                "appNotificationId" : CommonStrings.fcmToken as AnyObject,
                "appOs" : CommonStrings.strSysName as AnyObject,
                "appversion" : CommonStrings.appversion as AnyObject,
                "deviceName" : CommonStrings.deviceName as AnyObject,
                "deviceId" : CommonStrings.uniqueIdentifier as AnyObject,
                "referCode":self.referralTF!.text as AnyObject]
            
           
            let headers = ["Authorization":CommonStrings.fcmToken,
                           "Content-Type": "application/json"]

            Alamofire.request(signUpURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                
                var request = NSMutableURLRequest()
                request.setValue(CommonStrings.fcmToken , forHTTPHeaderField: "Authorization")
                print(CommonStrings.fcmToken)
              
                if let responsee = response.result.value as? [String: Any] {
                if response.result.isSuccess
                {
                    let userMessage = responsee["userMessage"] as! String
                    self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: userMessage, completion: {_ in})
                    }
                
                else {
          let userMessage = responsee["userMessage"] as! String
          self.showAlertWithConformation(withTitle: "LetMeCall", andMessage: userMessage, completion: {_ in})                }
                }
        
            }
            
        }
        
    }
    
    
    @IBAction func clickOnBack(_ sender: Any) {
        let  back = IntroductionVC()
        self.navigationController?.pushViewController(back, animated: true)
    }
    
    @IBAction func clickOnShow(_ sender: Any) {
        
    }
    @IBAction func clickOnZipInfo(_ sender: Any) {
    }
    @IBAction func clickOnReferralInfo(_ sender: Any) {
    }
    @IBAction func clickOnTermAndCondtns(_ sender: Any) {
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


