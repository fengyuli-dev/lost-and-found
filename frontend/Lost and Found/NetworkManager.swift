//
//  NetworkManager.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/29/21.
//

import Foundation
import Alamofire;

class NetworkManager:Codable{
    static let endpoint = "http://0.0.0.0:3000";
    static let userInfoKey = "userInfo"
    
    static func register(email:String,password:String,completion: @escaping (User1)->Void, errorHandler:@escaping (String)->Void){
        print(email);print(password)
        let parameters :[String:String] = [
            "email":email,
            "password":password
        ]
        print(parameters)
        print("now registering.")
//        let headers = [
//            HTTPHeader(name: "Authorization", value: <#T##String#>)
//        ]
        AF.request("\(endpoint)/api/register/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 0 ..< 1000) // TODO: make this range smallest possible
            .responseData { response in
            switch response.result {
            case .failure(let error):
                print("register failure.")
                print(error)
            case .success(let responseData):
                print(String(decoding: responseData, as: UTF8.self))
                do {
                    let decodedResponse = try JSONDecoder().decode(User1.self, from: responseData)
                    print(decodedResponse)
//                    UserDefaults.standard.setValue(decodedResponse, forKey: userInfoKey)
                    completion(decodedResponse)
                } catch let jsonError {
                    print("and we are here, in register?")
                    errorHandler("false")
                    print(jsonError)
                }
            }
        }
    }
    
    static func login(email:String,password:String,completion: @escaping (User1)->Void, errorHandler:@escaping (String)->Void){
        print(email);print(password)
        let parameters :[String:String] = [
            "email":email,
            "password":password
        ]
        print(parameters)
        print("now logging in.")
//        let headers = [
//            HTTPHeader(name: "Authorization", value: <#T##String#>)
//        ]
        AF.request("\(endpoint)/api/login/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 0 ..< 1000) // TODO: make this range smallest possible
            .responseData { response in
            switch response.result {
            case .failure(let error):
                print("login failure.")
                print(error)
            case .success(let responseData):
                print(String(decoding: responseData, as: UTF8.self))
                do {
                    let decodedResponse = try JSONDecoder().decode(User1.self, from: responseData)
                    print(decodedResponse)
//                    UserDefaults.standard.setValue(decodedResponse, forKey: userInfoKey)
                    completion(decodedResponse)
                } catch let jsonError {
                    print("and we are here, in login?")
                    errorHandler("false")
                    print(jsonError)
                }
            }
        }
    }
    
    
    static func getAllLost(completion: @escaping ([Item])->Void) {
        AF.request("\(endpoint)/api/lost/", method: .get).validate().responseData { response in
            switch response.result{
            case .failure(let error):
                print(error);
            case .success(let data):
                print("getAllLost succeeds")
                let jsonDecoder = JSONDecoder();
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase;
                if let lostResponse = try? jsonDecoder.decode([Item].self, from: data){
                    let lostItems = lostResponse;
                    print("getAllLost if let succeeds")
                    completion(lostItems);
                }
            }
        }
    }
    
    
    static func getAllFound(completion: @escaping ([Item])->Void) {
        AF.request("\(endpoint)/api/found/", method: .get).validate().responseData { response in
            switch response.result{
            case .failure(let error):
                print(error);
            case .success(let data):
                print("getAllFound succeeds")
                let jsonDecoder = JSONDecoder();
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase;
                if let foundResponse = try? jsonDecoder.decode([Item].self, from: data){
                    let foundItems = foundResponse;
                    print("getAllFound if let succeeds")
                    completion(foundItems);
                }
            }
        }
    }
    
    
    static func postLost(name:String,time:String,description:String,location:String,completion: @escaping (Item) -> Void){
        let parameter = [
            "name":name,
            "description":description,
            "time":time,
            "location":location
        ]
        AF.request("\(endpoint)/api/lost", method: .post, parameters: parameter, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result{
            case .failure(let error):
                print(error);
            case .success(let data):
                let jsonDecoder = JSONDecoder();
                print("lostPostSucceeds")
                if let lostpost = try? jsonDecoder.decode(Item.self, from:data){
                    print("updateLost if let succeeds");
                    let lost = lostpost;
                    completion(lost);
                }
            }
        }
    }
}
