//
//  ForgotPasswrdVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 25/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class ForgotPasswrdVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions

    @IBAction func clickOnClose(_ sender: Any) {
        let loginVC  = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func clickOnSendPswd(_ sender: Any) {
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
