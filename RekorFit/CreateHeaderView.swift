//
//  CreateHeaderView.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-05-02.
//  Copyright © 2017 LISA. All rights reserved.
//


import UIKit
protocol CreateHeaderDelegate {
    func setNumSets(sets: NSInteger, section: NSInteger)
}
class CreateHeaderView: UIView {
    

    var exercise = Exercise()
    var exerciseLabel = UILabel()
    var setsLabel = UILabel()
    var setStepper = UIStepper()
    let screenSize: CGRect = UIScreen.main.bounds
    var delegate: CreateHeaderDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBehaviour(section: NSInteger) {
        
        let headerHeight = screenSize.width/7
        exerciseLabel = UILabel.init(frame: CGRect(x: screenSize.width/20, y: 0, width: screenSize.width/4, height: headerHeight))
        exerciseLabel.text = exercise.title
        setsLabel = UILabel.init(frame: CGRect(x: screenSize.width/20 + exerciseLabel.frame.maxX, y: 0, width: screenSize.width/4, height: headerHeight))
        setStepper = UIStepper.init(frame: CGRect(x: setsLabel.frame.maxX+screenSize.width/20, y: 0, width: screenSize.width/6, height: headerHeight))
        setStepper.backgroundColor = UIColor.green
        setsLabel.backgroundColor = UIColor.red
        exerciseLabel.backgroundColor = UIColor.blue
        setStepper.tag = section + K.Tag.CreateHeaderStepper.rawValue
        setStepper.minimumValue = 1
        setStepper.maximumValue = 200
        setStepper.stepValue = 1
        setStepper.value = 3
        setStepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        
        self.addSubview(setStepper)
        self.addSubview(exerciseLabel)
        self.addSubview(setsLabel)

    }
    func stepperPressed(sender: UIStepper) {
        let stepperValue = Int(sender.value)

        print("Stepper: \(stepperValue)")
        setsLabel.text = "\(stepperValue)"
        let index = sender.tag - K.Tag.CreateHeaderStepper.rawValue
        delegate.setNumSets(sets: stepperValue, section: index)
    }
}
