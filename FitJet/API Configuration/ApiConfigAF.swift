//
//  ApiConfigAF.swift
//  FitJet
//
//  Created by Pavithran P K on 15/11/25.
//

import Foundation
import Alamofire

class ApiConfigAF: NSObject {
    
    func GetRequestAF(userReq:String?, completion:@escaping(_ Response:Data)-> Void) {
        
        AF.request(userReq ?? "").response(completionHandler: { responseData in
            switch responseData.result {
                
            case.success(let json):
                if let jsonData = json {
                    completion(jsonData)
                }
            case.failure(let errorAF):
                print(errorAF)
            }
        })
        
    }
}
