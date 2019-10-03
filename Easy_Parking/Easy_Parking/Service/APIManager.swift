//
//  APIManager.swift
//  Easy_Parking
//
//  Created by pathomphong charoenwichianchay on 3/10/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation
enum APIError: Error {
  case invalidJSON
  case invalidData
}

class APIManager {
  let a = ViewQRController()
  
  init(price:String) {
        print("API Start .. ")
         let urlString = "https://api.partners.scb/partners/sandbox/v1/oauth/token"
              print("url .. "+urlString)
          guard let urll = URL(string: urlString) else { return }
           var request = URLRequest(url: urll)
          request.httpMethod = "POST"
             
         let json: [String: Any] = ["applicationKey": "l7f630937ca15d4bb28aeb30a487125dc5",
                                     "applicationSecret": "91e93c3d86334b5983fe23c899a0e715"]
        
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.setValue("l7f630937ca15d4bb28aeb30a487125dc5", forHTTPHeaderField:"resourceOwnerId")
        request.setValue("{{$guid}}", forHTTPHeaderField:"requestUId")
        request.setValue("EN", forHTTPHeaderField:"accept-language")
//
        
         let jsonData = try? JSONSerialization.data(withJSONObject: json)
         request.httpBody = jsonData
             print("TTTTTTEEEEEEESSSSSSSTTTTTTT")
          let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
              if let error = error {
                  print("error: \(error)")
              } else {
                  if let response = response as? HTTPURLResponse {
                      print("statusCode: \(response.statusCode)")
                }
                 if let data1 = data, let dataString = String(data: data1, encoding: .utf8) {
                   
                   let stringJson = (""+dataString+"")
                    let stringJson2 = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
                                       print(stringJson)
                                       print(stringJson2)
                                        print("====================================")
                                       //var jsonString = "[\(dataString)]"
                                       let data2 = Data(stringJson.utf8)
                                       let data3 = Data(stringJson2.utf8)
                    
                                       print(data2)
                                       print(data3)

                                                
             
                        do {
                            var entity_guid : Int = 0
                            var user_guid : Int = 0
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
                                     
                                  self.requestQR(accesstoken: accessToken, price:price)
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
  

  private func requestQR(accesstoken: String ,price:String) -> Void{
      
        print("####################### requestQR #######################")
        //let urlString2 = "https://api.partners.scb/partners/sandbox/v1/payment/qrcode/create"
        let url = URL(string: "https://api.partners.scb/partners/sandbox/v1/payment/qrcode/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json"    , forHTTPHeaderField:"Content-Type")
        request.setValue("Bearer "+accesstoken , forHTTPHeaderField:"authorization")
        request.setValue("l7f630937ca15d4bb28aeb30a487125dc5",forHTTPHeaderField:"resourceOwnerId")
        request.setValue("{{$guid}}", forHTTPHeaderField:"requestUId")
        request.setValue("EN", forHTTPHeaderField:"accept-language")
        //print("calprice: \(calPrice)")
        let parameters: [String: Any] =
        [
            "qrType": "CS",
            "merchantId": "062541946488497",
            "terminalId": "047444374717436",
            "invoice": "INVOICE",
            "amount": price,
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

                                                if(jsonitem.key == "qrImage"){
                                                    qrImage = jsonitem.value as! String
                                                    print("!!!!!!")
                                                    print(qrImage)
                                                  print("!!!!!!")

                                                }

                                            }
                                                   }
                                                   }
                                           
                                           } catch {
                                               
                                               print(error.localizedDescription)
                                           }
                                       
                }
            }
        }
        task.resume()
        
        
        
        
    
    }

        
  
}
