//
//  ViewController.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 25/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension UIViewController
{
    func showAlertWithConformation(withTitle title:String, andMessage message:String,completion:@escaping (_ success:Bool)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (alert) in
            completion(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            completion(false)
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
}



