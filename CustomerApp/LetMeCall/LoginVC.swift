//
//  LoginVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 25/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit
import Toast_Swift
import Alamofire
import SwiftyJSON



class LoginVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var showBtn: UIButton!
    let loginURL = "http://45.33.46.234:8080/api//v0/login"

    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if defaultValues.string(forKey: "username") != nil{
//            let setLocation = SetLocationVC()
//            self.navigationController?.pushViewController(setLocation, animated: true)
        }
    
    
@IBAction func clickOnLogin(_ sender: Any) {
    
    let headers = ["Authorization":CommonStrings.fcmToken,
        "Content-Type": "application/json"]

    let parameters: Parameters=[
        "username":self.emailTF.text!,
        "password":self.passwordTF.text!,
        "appNotificationId":CommonStrings.fcmToken,
        "appOs":CommonStrings.strSysName,
        "appversion":CommonStrings.appversion,
        "deviceName":CommonStrings.deviceName,
        "deviceId":CommonStrings.uniqueIdentifier]


        if Reachability.isConnectedToNetwork(){
            
            if self.emailTF.text?.count == 0
            {
        self.showAlertWithConformation(withTitle: "Invalid!", andMessage: "Email Can not be Empty", completion: {_ in})

            }else if self.passwordTF.text?.count == 0
            {
                   self.showAlertWithConformation(withTitle: "Invalid!", andMessage: "Password Can not be Empty", completion: {_ in})
            }
            else{
       
          Alamofire.request(loginURL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: headers).responseJSON {
            
                response in
            if response.result.isSuccess
            {
                if let responsee = response.result.value as? [String: Any] {
                   let userMessage = responsee["userMessage"] as! String
                    print(userMessage)
                    print(responsee)
                    let setLocation = SetLocationVC()
                    self.navigationController?.pushViewController(setLocation, animated: true)
                    
                }
            }
            else {
                print("failure")
            }
//                switch response.result {
//                case .success:
//                    print(response)
//                    print(response.r)
//                    let setLocation = SetLocationVC()
//                    self.navigationController?.pushViewController(setLocation, animated: true)
//
//                    break
//                case .failure(let error):
//                    print(error)
//            self.showAlertWithConformation(withTitle: "Invalid!", andMessage: "User is not exist", completion: {_ in})
//                }
            }
    }
        }
        else
        {
       self.showAlertWithConformation(withTitle: "OOPS!", andMessage: "No Internet Connection", completion: {_ in})
            
        }
        }
    
    @IBAction func clickOnShow(_ sender: Any) {
        if self.passwordTF.text == ""
         {
            self.view.makeToast("please Enter Password")
            
//            self.view?.makeToast("sfdgs", duration: 2.0, point: CGPoint(x: 0, y: 0), title: "sdf", image: UIImage(named: "Email.png"), style:ToastPosition.center, completion: nil)
            }

         else
         {
        if self.passwordTF.isSecureTextEntry == true
        {
            self.passwordTF.isSecureTextEntry = false
            self.showBtn.setTitle("HIDE", for: UIControl.State.normal)
        }
        else {
            self.passwordTF.isSecureTextEntry = true
            self.showBtn.setTitle("SHOW", for: UIControl.State.normal)
        }
    }
    }
    
    
    @IBAction func clickOnForgotPswd(_ sender: Any) {
        let forgotPswdVC = ForgotPasswrdVC()
        self.navigationController?.pushViewController(forgotPswdVC, animated: true)
    }
    
    @IBAction func clickOnBack(_ sender: Any) {
        
        let  back = IntroductionVC()
        self.navigationController?.pushViewController(back, animated: true)
    }

}


