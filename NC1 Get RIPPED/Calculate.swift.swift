//
//  Calculate.swift.swift
//  NC1 Get RIPPED
//
//  Created by Charisel Christian Limantara on 27/04/22.
//

import Foundation

class Calculator {
    var goal: Double
    var speed: Double
    var weight: Double
    
    init (goal: Double, speed: Double, weight: Double) {
    self.goal=goal
    self.speed=speed
    self.weight=weight
    }
    func Calculate()->Double {
    return goal*speed*weight
    }
} 
