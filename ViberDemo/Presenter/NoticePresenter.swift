//
//  NoticePresenter.swift
//  ViberDemo
//
//  Created by Ominext on 2/24/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import UIKit

class NoticePresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller:navigationController)
    }

}

extension NoticePresenter: InteractorToPresenterProtocol{
    
    func noticeFetchedSuccess(noticeModelArray: Array<NoticeModel>) {
        view?.showNotice(noticeArray: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
}
