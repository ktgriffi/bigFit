//
//  ChooseExerciseDataProvider.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-05-01.
//  Copyright © 2017 LISA. All rights reserved.
//

import Foundation

import UIKit

class ChooseExerciseDataProvider: NSObject, UITableViewDataSource,UITableViewDelegate   {
    
    let screenSize: CGRect = UIScreen.main.bounds
    var exerciseArray = NSArray()
    var chosenExercises = [Exercise]()
    private var cellIdentifer = "Exercise_Cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return exerciseArray.count
        
    }
    func registerCellsForTableView(tableView: UITableView) {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as UITableViewCell
        let exercise = Exercise(fromDict: exerciseArray.object(at: indexPath.section) as! NSDictionary)
        cell.textLabel?.text = exercise.title
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenSize.height/13
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height/7))
        
        
        return headerView
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height/7))
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedExercise = Exercise.init(fromDict: exerciseArray.object(at: indexPath.section) as! NSDictionary)
        print("Can add \(selectedExercise.title)")
        chosenExercises.append(selectedExercise)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

    }
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        print("removed \(chosenExercises[indexPath.section].title)")
        if chosenExercises.count > 0 {
            let selectedExercise = Exercise.init(fromDict: exerciseArray.object(at: indexPath.section) as! NSDictionary)

            for index in 0...chosenExercises.count-1{
                let anExercise = chosenExercises[index]
                if anExercise.title == selectedExercise.title {
                    chosenExercises.remove(at: index)
                    break
                }
            }
  
        }

    }
}
