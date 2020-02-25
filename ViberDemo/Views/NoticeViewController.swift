//
//  NoticeViewController.swift
//  ViberDemo
//
//  Created by Ominext on 2/24/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {
  var presentor:ViewToPresenterProtocol?
  let cellId:String = "NoticeCell"

  @IBOutlet weak var myTableView: UITableView!
  var noticeArrayList:Array<NoticeModel> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.title = "Notice-Module"
      presentor?.startFetchingNotice()
//        self.myTableView.register(UINib(nibName: self.cellId, bundle: nil), forCellReuseIdentifier: self.cellId)
//      myTableView.delegate = self
//      myTableView.dataSource = self
      myTableView.reloadSectionIndexTitles()
      myTableView.backgroundColor = .white
     
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print(noticeArrayList.count)
  }

}

extension NoticeViewController:PresenterToViewProtocol{
  
  func showNotice(noticeArray: Array<NoticeModel>) {
    self.noticeArrayList =  noticeArray
    self.myTableView.reloadData()
    
  }
  
  func showError() {
    let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  
}



extension NoticeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
//        cell.id.text = noticeArrayList[indexPath.row].id
      cell.title.text = noticeArrayList[indexPath.row].title
    
//        cell.brief.text = noticeArrayList[indexPath.row].brief
//        cell.file_source.text = noticeArrayList[indexPath.row].filesource

        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        presentor?.showMovieController(navigationController: navigationController!)
//
//    }
    
    
}
