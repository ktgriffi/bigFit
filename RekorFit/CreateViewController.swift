//
//  CreateViewController.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-04-30.
//  Copyright © 2017 LISA. All rights reserved.
//

import UIKit

class CreateViewController: UITableViewController, CreateDataProviderDelegate, ChooseExerciseDelegate {
    var dataProvider = CreateDataProvider()
    let screenSize: CGRect = UIScreen.main.bounds
    let TITLE_TAG = 1111
    let HEADER_TAG = 2222
    let FIELD_TAG = 3333
    let DBUTTON_TAG = 4444

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
        dataProvider.delegate = self

        dataProvider.registerCellsForTableView(tableView: tableView)

        self.view.backgroundColor = UIColor.yellow
        setHeaderView()
        setFooterView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setHeaderView() {
        let headerView = UIView.init(frame: CGRect(x: screenSize.width/30, y: screenSize.height/5, width: screenSize.width, height: screenSize.height/8))
        let title = UILabel.init(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: screenSize.height/8))
        title.center = CGPoint(x: screenSize.width/2, y: title.center.y)
        title.text = dataProvider.workout.title
        title.textAlignment = .center
        title.tag = TITLE_TAG
        headerView.addSubview(title)
        
        let editButton = UIButton.init(frame: title.frame)
        
        editButton.addTarget(self, action: #selector(editWorkoutTitle), for: .touchUpInside)
        
        editButton.backgroundColor = UIColor.clear
        headerView.addSubview(editButton)
        let backBtn = UIButton(type: .custom)
        
        backBtn.setTitle("Back", for: UIControlState.normal)
        backBtn.setTitleColor(UIColor.blue, for: .normal)
        backBtn.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
        backBtn.frame = CGRect(x: screenSize.width/20, y: screenSize.height/15, width: 40, height: 40)
        backBtn.backgroundColor = UIColor.clear
        headerView.addSubview(backBtn)
        headerView.tag = HEADER_TAG
        
        
//        let nextBtn = UIButton.init(frame: CGRect(x: screenSize.width*6/7, y: screenSize.height/15, width: 40, height: 40))
//        
//        
//        nextBtn.setTitle("Next", for: UIControlState.normal)
//        nextBtn.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
//        headerView.addSubview(nextBtn)
        

        
        self.tableView.tableHeaderView = headerView
    }
    func removeView() {
        self.dismiss(animated: true, completion: nil)
    }
    func editWorkoutTitle() {
        let label = self.tableView.viewWithTag(TITLE_TAG) as! UILabel
        let textField = UITextField.init(frame: label.frame)
        label.removeFromSuperview()
        textField.textAlignment = .right
        textField.text = dataProvider.workout.title
        textField.becomeFirstResponder()
        textField.tag = FIELD_TAG
        self.tableView.addSubview(textField)
        let doneButton = UIButton.init(frame: CGRect(x: textField.frame.maxX, y: textField.frame.minY, width: 40, height: 40))
        doneButton.backgroundColor = UIColor.blue
        doneButton.tag = DBUTTON_TAG
        doneButton.addTarget(self, action: #selector(doneEditingTitle), for: .touchUpInside)

        self.tableView.addSubview(doneButton)
    }
    
    func doneEditingTitle() {
        let textField = self.tableView.viewWithTag(FIELD_TAG) as! UITextField
        dataProvider.workout.title = textField.text!
        let doneButton = self.tableView.viewWithTag(DBUTTON_TAG)
        doneButton?.removeFromSuperview()
        textField.removeFromSuperview()
        setHeaderView()
    }
    
    func getNewExercise(){
        let modalVC = ChooseExerciseViewController()
        modalVC.delegate = self
        if let path = Bundle.main.path(forResource: "ExerciseResource", ofType: "plist") {
            modalVC.dataProvider.exerciseArray = NSArray(contentsOfFile: path)!
        }
        self.present(modalVC, animated: true, completion: nil)
    }
    
    func passExercise(exercises: Workout){
        if dataProvider.workout.exercises.count == 0 {
            dataProvider.workout.exercises = exercises.exercises
        }else{
            dataProvider.workout.joinWorkouts(workout: exercises)
        }
        for exercise in dataProvider.workout.exercises {
            dataProvider.workout.addSet(exercise: exercise)
        }
        self.tableView.reloadData()
    }
    
    func setFooterView() {
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height/7))
        let button = UIButton(type: .custom)
        
        button.setTitle("Add exercise", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(getNewExercise), for: .touchUpInside)
        
        button.frame = footerView.frame
        button.backgroundColor = UIColor.blue
        footerView.addSubview(button)
        
        self.tableView.tableFooterView = footerView
    }

    func setNumSetsFromHeader(sets: NSInteger, exercise: Exercise) {
        self.tableView.reloadData()
    }
}
