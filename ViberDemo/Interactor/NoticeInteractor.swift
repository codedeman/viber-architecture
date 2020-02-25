//
//  NoticeInteractor.swift
//  ViberDemo
//
//  Created by Ominext on 2/24/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON
class NoticeInteractor: PresenterToInteractorProtocol {
  var presenter: InteractorToPresenterProtocol?
  
  func fetchNotice() {
    Alamofire.request(API_MOVIE_LIST).responseJSON { (response) in
      if (response.response?.statusCode == 200){
        
        if let error = response.error{
          
          print("Error \(error)")
        }
        do{
          let json = try JSON(data: response.data!)
          let arrayResponse = json["movie_list"].arrayObject
          let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
          self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)

        }catch{
          self.presenter?.noticeFetchFailed()
        }

    }
    }
    
  }
  
  
   
}
