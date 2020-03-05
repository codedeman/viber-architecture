//
//  PostService.swift
//  ViberDemo
//
//  Created by Ominext on 2/26/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Alamofire
import Foundation

class PostService {
  
    static func getPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts?userId=1"
        Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            
            if let data = response.result.value {
                
                let jsonResponse = data as! NSArray
                print(jsonResponse)
                let dictionaryItems = jsonResponse as? [[String: Any]]
                
                guard let arrayItems = dictionaryItems else {
                  completionHandler(nil,response.error)
                    return
                }
                
                let listPosts = arrayItems.map({ (dic) -> Post in
                    return Post(JSON: dic)!
                })
                
                //let size = jsonResponse["size"] as? Int
                completionHandler(listPosts, nil)
                
            } else {
              completionHandler(nil,response.error)
                
            }
        }
        )
    }
}
