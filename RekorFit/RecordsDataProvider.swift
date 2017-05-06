//
//  RecordsDataProvider.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-04-30.
//  Copyright © 2017 LISA. All rights reserved.
//

import Foundation

import UIKit

class RecordsDataProvider: NSObject, UITableViewDataSource,UITableViewDelegate   {
    
    let screenSize: CGRect = UIScreen.main.bounds
    private var cellIdentifer = "Records_Cell"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func registerCellsForTableView(tableView: UITableView) {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as UITableViewCell

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenSize.height/7
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return screenSize.width
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return screenSize.height/7
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.width))


        return headerView
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height/7))

        return footerView
    }

}
