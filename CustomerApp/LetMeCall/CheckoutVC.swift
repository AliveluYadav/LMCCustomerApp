//
//  CheckoutVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 19/02/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    let sectionNamArry = ["Delivery Information","Driver Tip","Promo Code","Wallet","Payment Summary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100

tableView.register(DeliveryInfoCell.self, forCellReuseIdentifier: "Cell")
tableView.register(UINib.init(nibName: "DriverTipCell", bundle: nil), forCellReuseIdentifier: "DriverTipCell")
tableView.register(UINib.init(nibName: "PromoCodeCell", bundle: nil), forCellReuseIdentifier: "PromoCodeCell")
tableView.register(UINib.init(nibName: "WalletCell", bundle: nil), forCellReuseIdentifier: "WalletCell")
tableView.register(UINib.init(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: "PaymentCell")
        
//    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNamArry.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return 3
        }
        else if section == 1
        {
            return 1
        }
        else if section == 2
        {
            return 1
        }
        else if section == 3
        {
          return 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DeliveryInfoCell

        if indexPath.section == 0
        {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DeliveryInfoCell
         return cell
        }
        else if indexPath.section == 1
         {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "DriverTipCell", for: indexPath) as! DriverTipCell
            
            return cell
            
    }
        else if indexPath.section == 2
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletCell", for: indexPath) as! WalletCell
           
            return cell

        }
        else if indexPath.section == 3
        {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromoCodeCell", for: indexPath) as! PromoCodeCell

            return cell
        }
            
            
        else if indexPath.section == 4
        {
            
      let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
            
            return cell

        }
       return cell

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let frame: CGRect = tableView.frame
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.backgroundColor = UIColor.orange
        
        let title = UILabel(frame: CGRect(x: 10, y: 10, width: frame.size.width, height: 30))
        title.textColor = UIColor.black
        title.font = UIFont.boldSystemFont(ofSize: 25)
        headerView.addSubview(title)
        
        if section == 0
        {
            title.text = "Delivery Information"
        }
        else if section == 1
        {
            title.text = "Driver Tip"
        }
        else if section == 2
        {
            title.text = "Wallet"
        }
        else if section == 3
        {
            title.text = "PromoCode"
        }
        else if section == 4
        {
            title.text = "Payment Summary"
        }
        
        return headerView
    }
    
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if indexPath.section == 0
//        {
//            tableView.rowHeight = 100
//        }
//        else if indexPath.section == 1
//       {
//            tableView.rowHeight = 100
//        }
//        else if indexPath.section == 2
//        {
//            tableView.rowHeight = 100
//        }
//        else if indexPath.section == 3
//        {
//            tableView.rowHeight = 150
//        }
//        else
//        {
//            tableView.rowHeight = 100
//        }
//
//        return tableView.rowHeight
//    }
   
}



