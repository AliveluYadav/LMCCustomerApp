//
//  AccountVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 31/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class AccountVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var imageArry = ["Driver copy.png","Email.png","password.png"]
    var profileArry = ["Name:","Email:","PhoneNo:"]
    var nameArry = ["Aliveu","alivelu7193@gmail.com","9010402748"]
    var sectionNameArry = ["Profile","ChangePassword"]
    
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            //  self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.register(UINib.init(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
    tableView.register(UINib.init(nibName: "ChangePswdCell", bundle: nil), forCellReuseIdentifier: "ChangePswdCell")
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
            // view.backgroundColor = UIColor.yellow
            title = "Account"
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
            
        //  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
            
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0
            {
            return self.nameArry.count
            }
            else
            {
                return 1
            }
        }
    
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.imgVw.image = UIImage(named: imageArry[indexPath.row])
            cell.profileLbl.text = profileArry[indexPath.row]
            cell.nameLbl.text = nameArry[indexPath.row]
    //      cell.textLabel?.text = self.dummyArry[indexPath.row]
            return cell
        }
        else
            {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ChangePswdCell", for: indexPath) as! ChangePswdCell
        return cell
                
                }
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 50
        }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let frame: CGRect = tableView.frame
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.backgroundColor = UIColor.orange
        
        let title = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        title.textColor = UIColor.white
        title.font = UIFont.boldSystemFont(ofSize: 18)
        
        let editButton = UIButton(frame: CGRect(x: frame.size.width - 60, y: 10, width: 50, height: 30))
        editButton.setTitleColor(UIColor.white, for: .normal)
        editButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        if section == 0
        {
            editButton.setTitle("EDIT", for: .normal)
            title.text = "Profile"
            
            headerView.addSubview(title)
            headerView.addSubview(editButton)
            
            return headerView
        }
            
        else{
            
            title.text = "Change Password"
            headerView.addSubview(title)
            return headerView
            
            
         }
        
      }

    }
