//
//  CarListTableViewCell.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class CarListTableViewCell: UITableViewCell {

  var btn_ShowQRCode: (()-> Void )?

  @IBAction func btn_ShowQR(_ sender: Any) {
    btn_ShowQRCode?()
  }
  @IBOutlet weak var carNumber: UILabel!
  @IBOutlet weak var carProvince: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
