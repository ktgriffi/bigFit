//
//  Constants.swift
//  RekorFit
//
//  Created by Kyle Griffith on 2017-04-30.
//  Copyright © 2017 LISA. All rights reserved.
//

import Foundation
struct K {
    let screenSize = 12

    struct Create {
        static let numSets = "numSets"
        static let exercise = "exercise"

    }
    struct num {
        static let High = "kHigh"
        static let Low = "kLow"
    }
    enum FontSize: Float {
        case small = 15.0
        case medium = 24.0
        case large = 25.0
        case veryLarge = 30.0
    }

    enum Exercise: String {
        case title = "title"
        case primaryMuscle = "primary_muscle"
        case secondaryMuscle = "secondary_muscle"
    }
    enum Contact: String  {
        case title = "title"
        case details = "description"
        case site = "site"
    }
    enum Tag: Int {
        case label = 5555
        case CreateHeaderStepper = 2222
    }
    enum RepRange: Int {
        case Singles = 1
        case Doubles = 2
        case Triples = 3
        case Strength = 5
        case HyperTrophy = 12
        case Cardio = 15
        
    }
    enum NumSets: Int {
        case Default = 3
    }
}
