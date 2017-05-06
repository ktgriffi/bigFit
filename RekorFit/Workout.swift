//
//  Workout.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-05-01.
//  Copyright © 2017 LISA. All rights reserved.
//
import UIKit

class Workout: NSObject {
    var title =  String() // no need (!). It will be initialised from controller
    var exercises = [Exercise]()
    var sets = [NSDictionary]()
    init(withTitle title: String) {
        self.title = title
        super.init()
    }
    
    convenience override init() {
        self.init(withTitle: "Chest Day")
    }
    
    public func joinWorkouts(workout: Workout) {
        

        exercises.append(contentsOf: workout.exercises)
        for _ in workout.exercises {
            let dict = [K.Create.exercise : exercises.last?.title ?? "Bench Press",
                        K.Create.numSets : K.RepRange.Strength.rawValue] as [String : Any]
            sets.append(dict as NSDictionary)
        }

    }

    public func addSet(exercise: Exercise){
        let dict = [K.Create.exercise : exercise.title,
                   K.Create.numSets: K.NumSets.Default.rawValue] as [String : Any]
    
        sets.append(dict as NSDictionary)
    }
}

