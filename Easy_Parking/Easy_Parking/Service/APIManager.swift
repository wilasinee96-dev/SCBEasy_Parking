//
//  Apimanager.swift
//  Easy_Parking
//
//  Created by Z64me on 3/10/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation



import Foundation

enum APIError: Error {
  case invalidJSON
  case invalidData
}
class APIManager{
  
  
  
  init() {

    let urlString = "https://api.partners.scb/partners/sandbox/v1/oauth/token"

    guard let urll = URL(string: urlString) else { return }
    var request = URLRequest(url: urll)
    request.httpMethod = "POST"

    let json: [String: Any] = [
      "applicationKey":"l7f630937ca15d4bb28aeb30a487125dc5",
      "applicationSecret":"91e93c3d86334b5983fe23c899a0e715"]

    request.setValue("application/json", forHTTPHeaderField:"Content-Type")
    request.setValue("l7f630937ca15d4bb28aeb30a487125dc5", forHTTPHeaderField:"resourceOwnerId")
    request.setValue("{{$guid}}", forHTTPHeaderField:"requestUId")
    request.setValue("EN", forHTTPHeaderField:"accept-language")

    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    request.httpBody = jsonData

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print("error: \(error)")
      } else {
        if let response = response as? HTTPURLResponse {
          print("statusCode: \(response.statusCode)")
        }
        if let data1 = data, let dataString = String(data: data1, encoding: .utf8) {

          let stringJson = (""+dataString+"")
          let data2 = Data(stringJson.utf8)
          do {
            let jsonResult = try JSONSerialization.jsonObject(with: data2, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            // Parse JSON data
            do {
              var accessToken = ""
              if let jsonP = jsonResult?["data"] as? [String:Any]{
                print(jsonP)
                for jsonitem in jsonP {
                  if(jsonitem.key == "accessToken"){
                    accessToken = jsonitem.value as! String
                    print(  jsonitem.value)
                  }
                }

                self.requestQR(accesstoken: accessToken)
              }
            }catch {
              print(error.localizedDescription)
            }

          } catch {

            print(error.localizedDescription)
          }
        }
      }
    }
    task.resume()
  }

  
   func requestQR(accesstoken: String ) -> Void{
    print("####################### requestQR #######################")
    let url = URL(string: "https://api.partners.scb/partners/sandbox/v1/payment/qrcode/create")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json"    , forHTTPHeaderField:"Content-Type")
    request.setValue("Bearer "+accesstoken , forHTTPHeaderField:"authorization")
    request.setValue("l7f630937ca15d4bb28aeb30a487125dc5",forHTTPHeaderField:"resourceOwnerId")
    request.setValue("{{$guid}}", forHTTPHeaderField:"requestUId")
    request.setValue("EN", forHTTPHeaderField:"accept-language")
    
    let parameters: [String: Any] =
      [
        "qrType": "CS",
        "merchantId": "062541946488497",
        "terminalId": "047444374717436",
        "invoice": "INVOICE",
        "amount": "100.00",
        "csExtExpiryTime" : "60"
    ]
    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
    request.httpBody = jsonData
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print("error: \(error)")
      } else {
        if let response = response as? HTTPURLResponse {
          print("statusCode: \(response.statusCode)")
        }
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
          print("data: \(dataString)")
          let stringJsonn = (""+dataString+"")
          let dataa = Data(stringJsonn.utf8)
          
          do {
            
            
            let jsonResult2 = try JSONSerialization.jsonObject(with: dataa, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            // Parse JSON data
            
            do {
              var qrImage = ""
              if let jsonP = jsonResult2?["data"] as? [String:Any]{
                print(jsonP)
                for jsonitem in jsonP {
                  print("!!!!!!")
                  
                  if(jsonitem.key == "qrImage"){
                    qrImage = jsonitem.value as! String
                    print(qrImage)
                    let viewQRController = ViewQRController()
                    viewQRController.setString(stringImage: qrImage)
                  }
                }
               
              }
            }
            
          }
          catch {
            print("error")
            print(error.localizedDescription)
          }
          
        }
      }
    }
    task.resume()
  }
}
