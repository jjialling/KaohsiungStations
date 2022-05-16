//
//  RailwaysTableViewCell.swift
//  SmapleTableView6-29
//
//  Created by zencher on 2020/7/1.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class RailwaysTableViewCell: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var nameEnglish: UILabel!
    @IBOutlet weak var nameChinese: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
