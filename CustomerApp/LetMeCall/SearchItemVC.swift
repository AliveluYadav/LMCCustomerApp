//
//  SearchItemVC.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 12/02/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class SearchItemVC: UIViewController
//,UICollectionViewDataSource,UICollectionViewDelegate, UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var RestrantTimngLbl: UILabel!
    @IBOutlet weak var RestaurantNamLbl: UILabel!
    
    var daysArry = [String]()
    var datesArry = [Int]()
    var sectionNames = ["Starters","Veg Items ","NonVeg Items","Soups ","Biryani's","IceCreams","VegCurries","NonVeg Curries","Sweets","Section ten"]
    
    var increaseArry = ["sfgfggd","sfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggd","sfgfsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdggd","sfgfsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdsfgfggdggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd","sfgfggd",]
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        var bar = BarController()
        self.navigationController?.navigationBar.isHidden = true

    // self.navigationController?.pushViewController(bar, animated: true)
        
    }
    override func viewDidLoad() {
                super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

      tableView.register(UINib(nibName: "ItemsCell", bundle: nil), forCellReuseIdentifier: "ItemsCell")
      collectionView.register(UINib(nibName: "DateViewCollectnCell", bundle: nil), forCellWithReuseIdentifier: "DateViewCell")
        
        
        let cal = Calendar.current
        var startDate = cal.startOfDay(for: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        
        for i in 1 ... 7 {
            let date = cal.component(.day, from: startDate)
            self.datesArry.append(date)
            startDate = cal.date(byAdding: .day, value: +1, to: startDate)!
            let dayName = dateFormatter.string(from: startDate - 1)
            self.daysArry.append(dayName)
            
        }
    }
    
    @IBAction func clickOnClose(_ sender: Any) {
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }

}

extension SearchItemVC:UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return increaseArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as! ItemsCell

        cell.incresLbl.text = increaseArry[indexPath.row]

        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionNames[section]
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    

}
extension SearchItemVC:UICollectionViewDataSource,UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datesArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateViewCell", for: indexPath) as! DateViewCollectnCell
        
        cell.dateLbl.text = String(self.datesArry[indexPath.row])
        cell.dayLbl.text = self.daysArry[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateViewCell", for: indexPath) as! DateViewCollectnCell
        
        cell.isSelected = true
    }
    
}

