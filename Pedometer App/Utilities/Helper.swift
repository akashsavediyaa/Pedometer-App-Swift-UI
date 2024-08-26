//
//  Helper.swift
//  Pedometer App
//
//  Created by Akash Savediya on 26/08/24.
//

import Foundation

func isUnder8000(_ count: Int) -> Bool {
    return count < 1000
}


enum DisplayType: Int, Identifiable, CaseIterable {
    case list
    case chart
    
    var id: Int {
        rawValue
    }
    
}

extension DisplayType {
    var icon: String {
        switch self {
        case .list:
            return "list.bullet"
        case.chart:
            return "chart.bar"
        }
    }
}
