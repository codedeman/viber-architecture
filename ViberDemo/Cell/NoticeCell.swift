//
//  NoticeCell.swift
//  ViberDemo
//
//  Created by Ominext on 2/24/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit

class NoticeCell: UITableViewCell {

  @IBOutlet weak var id: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var brief: UILabel!
  @IBOutlet weak var file_source: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
