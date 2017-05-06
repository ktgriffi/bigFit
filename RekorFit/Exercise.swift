//
//  Exercise.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-04-30.
//  Copyright © 2017 LISA. All rights reserved.
//


import UIKit

class Exercise: NSObject {
    var title =  String() // no need (!). It will be initialised from controller
    var firstMuscle = String()
    var secondMuscle = String()
    
    init(fromDict dict: NSDictionary) {
        title = dict.value(forKey: K.Exercise.title.rawValue) as! String
        firstMuscle = dict.value(forKey: K.Exercise.primaryMuscle.rawValue ) as! String
        secondMuscle = dict.value(forKey: K.Exercise.secondaryMuscle.rawValue ) as! String
        
        super.init()
    }
    
    convenience override init() {
        let dict = [K.Exercise.primaryMuscle.rawValue :"For the rest of time",
                    K.Exercise.secondaryMuscle.rawValue:"Smoking is bad for you",
                    K.Exercise.title.rawValue:"exercise"] as [String : Any]
        self.init(fromDict:dict as NSDictionary) // calls above mentioned controller with default name
    }
}
