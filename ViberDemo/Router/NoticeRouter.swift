//
//  NoticeRouter.swift
//  ViberDemo
//
//  Created by Ominext on 2/24/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import UIKit
class NoticeRouter:PresenterToRouterProtocol{
  func pushToMovieScreen(navigationConroller: UINavigationController) {
      print("what the fuck")
  }
  
  static func createModule() -> NoticeViewController {
    
    let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! NoticeViewController
    
    
    let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
    let interactor: PresenterToInteractorProtocol = NoticeInteractor()
    let router:PresenterToRouterProtocol = NoticeRouter()
    
    view.presentor = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
  static var mainstoryboard: UIStoryboard{
      return UIStoryboard(name:"Main",bundle: Bundle.main)
  }
 
  
  

  

}
