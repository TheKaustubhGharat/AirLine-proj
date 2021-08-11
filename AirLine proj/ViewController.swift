//
//  ViewController.swift
//  AirLine proj
//
//  Created by makarand gharat on 04/08/21.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var refreshControl = UIRefreshControl()
    var AirplaneData: [NSDictionary] = []
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(since: 0)
        refreshControl.attributedTitle = NSAttributedString(string: "RefreshingData")
        refreshControl.addTarget(self, action: #selector(PullToRefresh(sender: )), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    
    @objc func PullToRefresh(sender: UIRefreshControl){
        sender.endRefreshing()
        tableView.reloadData()
    }
    
    
    private func fetchData (since: Int, per_page: Int = 6) {
        
        let url = URL(string: "https://api.instantwebtools.net/v1/airlines?since=\(since)&per_page=\(per_page)")!
        
        URLSession.shared.dataTask(with: url) { Data, Response, Error in
            
            do{
                let parseAirplaneData = try JSONSerialization.jsonObject(with: Data!, options: .mutableLeaves) as! [NSDictionary]
                self.AirplaneData = parseAirplaneData
                
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(Error?.localizedDescription as Any)
            }
        }.resume()
    }
    
    
   
        
}


extension ViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AirplaneData.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            let Name = AirplaneData[indexPath.row].value(forKey: "name") as? String
            cell.lblName.text = ("Name: \(Name!)")
            let Country = AirplaneData[indexPath.row].value(forKey: "country") as? String
        cell.lblCountry.text = ("Country: \(Country ?? "nill")")
        let logoUrl = URL(string: (AirplaneData[indexPath.row].value(forKey: "logo") as? String ?? "nil"))
            cell.imgLogo.kf.setImage(with: logoUrl)
            return cell
      
      
        }
        
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let dpVC = storyboard?.instantiateViewController(identifier: "DPViewController") as! DPViewController
        
        dpVC.strname = AirplaneData[indexPath.row].value(forKey: "name") as! String
        dpVC.strcountry = AirplaneData[indexPath.row].value(forKey: "country") as? String ?? "No Country Name Found!"
        dpVC.strimage = AirplaneData[indexPath.row].value(forKey: "logo") as? String ?? "No Logo Pushed at the server!"
        
        self.navigationController?.pushViewController(dpVC, animated: true)
        
        
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = AirplaneData.count - 1
        if indexPath.row == lastItem{
            fetchData(since: lastItem)
        }

    }

}







//       LOGICFORPAGINATION
//        logic 1
//        if indexPath.row == AirplaneData.count - 1 {
//            var index  = AirplaneData.count - 1
//            if index+6 > AirplaneData.count - 1
//            {
//                limit = AirplaneData.count - index
//            }
//            else {
//                limit = index + 6
//            }
//            while index < limit {
//                displayAirlines.append(AirplaneData[index])
//                index = index + 1
//            }
//        logic 2
//        let  lastItem = AirplaneData.count - 1
//        if indexPath.row == lastItem {
//            LoadMoreData()
//            self.perform(#selector(loadTable),with: nil,afterDelay: 0.5)
//        }
//
//
//    }
//
//    func LoadMoreData() {
//
//        for _ in 1...10
//        {
//            let lastItem = AirplaneData.last!
//            let newItem =  (AirplaneData.last) +  (AirplaneData.first!)
//            AirplaneData.append(newItem)
//        }
//        self.tableView.reloadData()
//    }
//    @objc func loadTable () {
//    self.tableView.reloadData()
        
    
        
        
    
    
    


