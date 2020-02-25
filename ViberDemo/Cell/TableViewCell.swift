//
//  TableViewCell.swift
//  ViberDemo
//
//  Created by Ominext on 2/25/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var brief: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
