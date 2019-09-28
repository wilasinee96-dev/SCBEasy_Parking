//
//  TableViewCellCarList.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class TableViewCellCarList: UITableViewCell {

  @IBOutlet weak var carName: UILabel!
  @IBOutlet weak var carNumber: UILabel!
  @IBOutlet weak var carZity: UILabel!
  
  @IBAction func pageQR(_ sender: Any) {
    
    
  }
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
