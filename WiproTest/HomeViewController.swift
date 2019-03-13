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


    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTableView.estimatedRowHeight = 60.0
        contentTableView.rowHeight = UITableView.automaticDimension
        
        self.loadTableViewContent()
    }
    

    func loadTableViewContent() {
        
        serviceRequest.getContentDetails { (contentDetails) in
            DispatchQueue.main.async {
                if contentDetails.count > 0
                {
                    self.contentDetailModel = contentDetails
                    self.contentTableView.reloadData()
                }
            }

        }
    }
}


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
