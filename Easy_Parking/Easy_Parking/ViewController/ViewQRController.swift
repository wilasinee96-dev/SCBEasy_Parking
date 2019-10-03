//
//  ViewQRController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class ViewQRController: UIViewController {
  
  @IBOutlet weak var qrImage: UIImageView!
  
  var im : UIImage?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    qrImage.image = im
  }
  
  var imageString:String = ""
  
  func setString(stringImage: String ){
    
    let dataDecoded: Data = Data(base64Encoded: stringImage, options: .ignoreUnknownCharacters)!
    let decodedImage = UIImage(data: dataDecoded)
    im = decodedImage
  }
}
