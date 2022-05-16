//
//  RailwaysDetailViewController.swift
//  SmapleTableView6-29
//
//  Created by zencher on 2020/7/1.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class RailwaysDetailViewController: UIViewController {
    
    var railwaysNum = ""
    var railwaysNameEnglish = ""
    var railwaysNameChinese = ""
    var railwaysLocation = ""

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameEnglish: UILabel!
    @IBOutlet weak var nameChinese: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = railwaysNum
        nameChinese.text = railwaysNameChinese
        nameEnglish.text = railwaysNameEnglish
        locationLabel.text = railwaysLocation

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
