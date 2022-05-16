//
//  RailwaysTableViewController.swift
//  SmapleTableView6-29
//
//  Created by zencher on 2020/7/1.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import Alamofire

class RailwaysTableViewController: UITableViewController ,UISearchBarDelegate{
    
    var arr1 = [Station]()
    var searchArr1 = [Station]()
    var searching = false

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var mineTableViw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
         

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching{
            return searchArr1.count
        }else{
            return arr1.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! RailwaysTableViewCell

        if searching{
            cell.numLabel.text = searchArr1[indexPath.row].車站代碼
            cell.nameChinese.text = searchArr1[indexPath.row].車站中文站名
            cell.location.text = searchArr1[indexPath.row].站位地點
        }else{
            cell.numLabel.text = arr1[indexPath.row].車站代碼
            cell.nameChinese.text = arr1[indexPath.row].車站中文站名
            cell.location.text = arr1[indexPath.row].站位地點
        }

        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            searchArr1 = arr1
            mineTableViw.reloadData()
        }else{
            
            let searchString = searchBar.text!
            searchArr1 = arr1.filter{ (station) -> Bool in
                return station.站位地點.contains(searchString)
            }
            searching = true
            mineTableViw.reloadData()
        }
    
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRailWaysDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RailwaysDetailViewController
                destinationController.railwaysNum = arr1[indexPath.row].車站代碼
                destinationController.railwaysNameChinese = arr1[indexPath.row].車站中文站名
                destinationController.railwaysNameEnglish = arr1[indexPath.row].車站英文站名
                destinationController.railwaysLocation = arr1[indexPath.row].站位地點
            }
        }
    }
    
    func fetchData() {
        
        AF.request("https://api.kcg.gov.tw/api/service/get/4eba94e0-323c-4530-95a6-dd276bd8765d")
        .validate()
        .responseDecodable(of: Stations.self) { (response) in
          guard let stations = response.value else { return }
            print(stations.data[0].車站中文站名)
            for i in 0..<stations.data.count{
                let a = stations.data[i]
                self.arr1.append(a)
                
                
                
            }
            self.mineTableViw.reloadData()
        }
        
    }
}
