//
//  Validation.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 04/02/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import Foundation

class Validation
{
    
   class func isValidEmail(_ email: String?) -> Bool {
        
        let stricterFilter = false
        let stricterFilterString = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let laxString = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailRegex = stricterFilter ? stricterFilterString : laxString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
  class func isValidPassword(_ checkString: String?) -> Bool {
        
        let stricterFilterString = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", stricterFilterString)
        return passwordTest.evaluate(with: checkString)
        
    }

    
    
}
