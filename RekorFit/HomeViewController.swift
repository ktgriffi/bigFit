//
//  HomeViewController.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-04-30.
//  Copyright © 2017 LISA. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    var dataProvider = HomeDataProvider()
    let screenSize: CGRect = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.registerCellsForTableView(tableView: tableView)
        tableView.allowsSelection = true
        self.view.backgroundColor = UIColor.blue

        styleNavBar()


        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func styleNavBar(){
        let createButton = UIButton(type: .custom)
        createButton.setTitle("+", for: .normal)
        createButton.setTitleColor(UIColor.blue, for: .normal)
        createButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        createButton.addTarget(self, action: #selector(goToCreateView), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: createButton)
        
        self.navigationItem.setRightBarButton( item1, animated: true)
        
//        let backBtn = UIButton(type: .custom)
//        
//        
//        backBtn.setTitleColor(UIColor.blue, for: .normal)
//        backBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
//        backBtn.addTarget(self, action: #selector(goToSettingsView), for: .touchUpInside)
//        let item2 = UIBarButtonItem(customView: backBtn)
//        
//        self.navigationItem.setLeftBarButton( item2, animated: true)
        
    }

    func goToCreateView() {
        let modalVC = CreateViewController()
        modalVC.dataProvider.workout = Workout.init(withTitle: "Custom Workout")
        self.present(modalVC, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

