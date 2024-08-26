//
//  StepsChartView.swift
//  Pedometer App
//
//  Created by Akash Savediya on 26/08/24.
//

import SwiftUI
import Charts

struct StepsChartView: View {
    let step: [Step]
    var body: some View {
        Chart {
            ForEach(step) { step in
                BarMark(x: .value("Date", step.date), y: .value("Count", step.count))
                    .foregroundStyle(isUnder8000(step.count) ? .red : .green)
            }
        }
    }
}

