//
//  ViREST.swift
//  Pods
//
//  Created by Sebastian Bierman-Lytle on 6/4/17.
//
//

import Foundation
import Alamofire
import SwiftyJSON

public struct ViREST {
    
    static let access_token: String = ""
    static let URL: String = ""
    
    public static func post(_ path: String) -> DataRequest {
        return Alamofire.request(ViREST.URL + path, method: .post)
    }
    
    public static func put(_ path: String) -> DataRequest {
        return Alamofire.request(ViREST.URL + path, method: .put)
    }
    
    public static func delete(_ path: String) -> DataRequest {
        return Alamofire.request(ViREST.URL + path, method: .delete)
    }
    
    public static func postJSON(_ path: String, _ parameters: Parameters) -> DataRequest {
        return Alamofire.request(ViREST.URL + path, method: .post, parameters: parameters, encoding: JSONEncoding.default)
    }
    
    public static func get(_ path: String) -> DataRequest {
        return Alamofire.request(ViREST.URL + path, method: .get)
    }
    
    public static func test(_ num: Int) {
        _ = Alamofire.request(ViREST.URL + "/test?num=\(num)", method: .get)
    }
    
    public static func get_user(_ num: Int) {
        _ = Alamofire.request(ViREST.URL + "/test?num=\(num)", method: .get)
    }
    
    public static func get_test_list(_ callback: @escaping (NSArray) -> Void) {
        Alamofire.request(ViREST.URL + "/testlist", method: .get)
            .responseJSON { response in
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                if response.data != nil {
                    if let json =  try? JSON(data: response.data!) {
                        let list = json["data"].array
                        callback(list! as NSArray)
                        return
                    }
                    print("error unwrapping JSON")
                }
        }
    }
    
    public static func update_email(_ email: String) {
        _ = Alamofire.request(ViREST.URL + "/update_email?user_id=1&access_token=" + access_token + "&email=" + email, method: .post)
    }
    
    
    // MARK: Modal Functions
    // --------------------------------------------------------------------------
    
    public static func create(_ modalName: String, data: JSON) {
        Alamofire.request(ViREST.URL + "/\(modalName)/create", method: .post)
            .responseJSON { response in
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                if response.data != nil {
                    if let json = try? JSON(data: response.data!) {
                        let res = json["result"].string
                        print(res!)
                    }
                    //callback(list! as NSArray)
                }
        }
    }
}
