//
//  Step.swift
//  Pedometer App
//
//  Created by Akash Savediya on 26/08/24.
//

import Foundation

struct Step: Identifiable {
    
    let id = UUID()
    let count: Int
    let date: Date
    
}
