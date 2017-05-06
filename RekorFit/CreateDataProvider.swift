//
//  CreateDataProvider.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-04-30.
//  Copyright © 2017 LISA. All rights reserved.
//


import Foundation

import UIKit

protocol CreateDataProviderDelegate {
    func getNewExercise()
    func setNumSetsFromHeader(sets: NSInteger, exercise: Exercise)
}
class CreateDataProvider: NSObject, UITableViewDataSource,UITableViewDelegate, CreateHeaderDelegate   {
    
    let screenSize: CGRect = UIScreen.main.bounds
    var workout = Workout()
    var delegate: CreateDataProviderDelegate!
    let STEP_TAG = 1111
    private var cellIdentifer = "Create_Cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if workout.sets.count > section {
            let dict = workout.sets[section] as NSDictionary
            let numSets = dict.object(forKey: K.Create.numSets) as! NSInteger
            return numSets
        }else{
            return 1
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if workout.exercises.count == 0 {
            return 0
        }else{
            return workout.exercises.count
        }
        
    }
    func registerCellsForTableView(tableView: UITableView) {
        
        tableView.register(CreateTableViewCell.self, forCellReuseIdentifier: cellIdentifer)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as! CreateTableViewCell
        cell.indexLabel.text = "\(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenSize.height/7
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return screenSize.height/10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return screenSize.height/7
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let headerView = CreateHeaderView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height/7))
        headerView.delegate = self
        headerView.exercise = workout.exercises[section]
        headerView.addBehaviour(section: section)
        return headerView
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height/7))

        return footerView
    }
    func chooseExercise() {
        delegate.getNewExercise()
    }
    func setNumSets(sets: NSInteger, section: NSInteger) {
        let exercise = workout.exercises[section]
        delegate.setNumSetsFromHeader(sets: sets, exercise: exercise)
    }

}
