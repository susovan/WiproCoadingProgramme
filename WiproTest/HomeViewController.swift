//
//  HomeViewController.swift
//  WiproTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    var contentDetailModel : [ContentDetailsModel]?
    var refreshControl   = UIRefreshControl()


    // ViewLifeCycle : ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentTableView.estimatedRowHeight = 60.0
        contentTableView.rowHeight = UITableView.automaticDimension
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.contentTableView.addSubview(self.refreshControl)
        self.loadTableViewContent()
    }
    
    
    //sender Call refreshTablview Function
    
    @objc func refresh(_ sender: Any) {
        
        self.refreshTableView()

    }

    //  LoadTableviewContent : call Websevice to get the Content
    // cotent Value > 0 Update the tableview.
    
    func loadTableViewContent() {
        
            Utility.showProgressView(view:self.view, title:"", detailstitle:"")
            if let reachability = Reachability(), reachability.isReachable {
                serviceRequest.getContentDetails { (contentDetails) in
                    DispatchQueue.main.async {
                        Utility.hideProgressView(view:self.view)
                        if contentDetails.count > 0
                        {
                            self.contentDetailModel = contentDetails
                            self.contentTableView.reloadData()
                        }else
                        {
                            Utility.showMessage(title:Constants.noContent, msg:Constants.pleaseTryAfterSomeTime)
                        }
                    }
                }
            }else
            {
                Utility.hideProgressView(view:self.view)
                Utility.showMessage(title:Constants.pleaseChcekInternetConnection, msg:Constants.pleaseTryaftersometime)
            }

    }
    
    
    // function Call to Update the Tableview
    
    func refreshTableView() {
        
     if  refreshControl.isRefreshing
     {
        if let reachability = Reachability(), reachability.isReachable {
            serviceRequest.getContentDetails { (contentDetails) in
                DispatchQueue.main.async {
                    Utility.hideProgressView(view:self.view)
                    if contentDetails.count > 0
                    {
                        self.contentDetailModel = contentDetails
                        self.contentTableView.reloadData()
                        self.refreshControl.endRefreshing()
                    }else
                    {
                        Utility.showMessage(title:Constants.noContent, msg:Constants.pleaseTryAfterSomeTime)
                        self.refreshControl.endRefreshing()
                    }
                }
            }
        }else
        {
            Utility.hideProgressView(view:self.view)
            Utility.showMessage(title:Constants.pleaseChcekInternetConnection, msg:Constants.pleaseTryaftersometime)
            self.refreshControl.endRefreshing()
        }
        
        }
        }
    }

//Tablevbiew Datasourse and Delegate

extension HomeViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contentDetailModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:Constants.ContentTableviewCustomCell, for: indexPath) as! ContentTableviewCustomCell
        if let contentModel = contentDetailModel  {
            cell.cellAttribute(modelValue:contentModel[indexPath.row])
        }
        return cell
}
}
