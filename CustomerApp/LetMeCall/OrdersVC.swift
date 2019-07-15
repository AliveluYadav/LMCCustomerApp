//
//  OrdersVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 31/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class OrdersVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
        var dummyArry = ["hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","hfjvfhh","Alivelu",]
        
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
        //  self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.register(UINib.init(nibName: "OrderHistoryCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryCell")
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
        // view.backgroundColor = UIColor.yellow
            title = "Home"
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
            
       //  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCell", for: indexPath) as! OrderHistoryCell
//        cell.textLabel?.text = self.dummyArry[indexPath.row]
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 210
        }
        
}
