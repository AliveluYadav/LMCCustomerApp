//
//  SetLocationVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 29/01/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class SetLocationVC: UIViewController{
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var countryNameArry = ["AmirKhan","Akshaykumar","AnilKapoor","SriDevi","sabita","manju","balu","kumar","gopi"]
    var searchArray = [String]()
    var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.delegate = (self as UITableViewDelegate)
        self.tableView.dataSource = (self as UITableViewDataSource)
        self.tableView.isHidden = true
        
        if self.searchBar.text == ""
        {
            self.tableView.isHidden = true
        }
        
    }
 
    @IBAction func clickOnClose(_ sender: Any) {
        
        let loginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
}

// MARK: - TableView Methods

extension SetLocationVC:UITableViewDataSource,UITableViewDelegate

{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.searching
        {
            if self.searchBar.text == ""
            {
                self.tableView.isHidden = true
                return self.searchArray.count

            }
            else{
            self.tableView.isHidden = false
            return self.searchArray.count
            }
        }
        else{
            self.tableView.isHidden = true
            return self.countryNameArry.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if self.searching
        {
            cell.textLabel?.text = self.searchArray[indexPath.row]
        }
        else{
                cell.textLabel?.text = self.countryNameArry[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == 0
        {
           cell.textLabel?.text = self.searchBar.text
            
            let tabBar = BarController()
            self.navigationController?.pushViewController(tabBar, animated: true)
            
        }
    }
    
}


// MARK: - SearchController Methods

extension SetLocationVC:UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchArray = self.countryNameArry.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        self.searching = true
        self.searchBar.delegate = self
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.tableView.isHidden = true
        self.searching = false
        self.searchBar.text = ""
        self.tableView.reloadData()
        
    }

}
   
    


    
    


