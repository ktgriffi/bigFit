//
//  ChooseExerciseViewController.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-05-01.
//  Copyright © 2017 LISA. All rights reserved.
//



import UIKit
protocol ChooseExerciseDelegate {
    func passExercise(exercises: Workout)
}
class ChooseExerciseViewController: UITableViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    var dataProvider = ChooseExerciseDataProvider()
    var delegate: ChooseExerciseDelegate!
    var workout = Workout()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.registerCellsForTableView(tableView: tableView)
        setHeaderView()
        tableView.allowsMultipleSelection = true


            
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setHeaderView() {
        let headerView = UIView.init(frame: CGRect(x: screenSize.width/30, y: screenSize.height/5, width: screenSize.width, height: screenSize.height/8))
        
        let backBtn = UIButton(type: .custom)
        
        backBtn.setTitle("Back", for: UIControlState.normal)
        backBtn.setTitleColor(UIColor.blue, for: .normal)
        backBtn.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
        backBtn.frame = CGRect(x: screenSize.width/20, y: screenSize.height/15, width: 40, height: 40)
        backBtn.backgroundColor = UIColor.clear
        headerView.addSubview(backBtn)
        
        
        
        let nextBtn = UIButton.init(frame: CGRect(x: screenSize.width*6/7, y: screenSize.height/15, width: 40, height: 40))
        
        
        nextBtn.setTitle("Next", for: UIControlState.normal)
        nextBtn.setTitleColor(UIColor.blue, for: .normal)

        nextBtn.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
        headerView.addSubview(nextBtn)

        
        self.tableView.tableHeaderView = headerView
    }

    
    func removeView() {
        self.dismiss(animated: true, completion: nil)
    }
    func goToNextView() {
        workout.exercises = dataProvider.chosenExercises
        delegate.passExercise(exercises: workout)
        self.dismiss(animated: true, completion: nil)

    }
        
    
}

