//
//  EateryDetailTableViewCell.swift
//  Eateries
//
//  Created by Илья Федорченко on 01/01/2019.
//  Copyright © 2019 Илья Федорченко. All rights reserved.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {

  @IBOutlet weak var valueLabel: UILabel!
  @IBOutlet weak var keyLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
