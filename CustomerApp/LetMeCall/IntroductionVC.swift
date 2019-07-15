//
//  IntroductionVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 25/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class IntroductionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: IBActions
    
    @IBAction func click_On_Login(_ sender: Any) {
        let loginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    @IBAction func Click_On_SignUp(_ sender: Any) {
        let signUpVC = SignUpVC()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
