//
//  ContentView.swift
//  Pedometer App
//
//  Created by Akash Savediya on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var healthStore = HealthStore()
    @State private var displayType: DisplayType = .list
    private var steps: [Step] {
        healthStore.steps.sorted { lhs, rhs in
            lhs.date > rhs.date
        }
    }
    var body: some View {
        VStack {
            if let step = steps.first {
                TodayStepCard(step: step)
            }
            Picker("Selection", selection: $displayType) {
                ForEach(DisplayType.allCases) { displayType in
                    Image(systemName: displayType.icon).tag(displayType)
                }
            }
            .pickerStyle(.segmented)
            
            switch displayType {
            case .list:
                StepListView(steps: Array(steps.dropFirst()))
            case .chart:
                StepsChartView(step: steps)
            }
            
            
        }
             .task {
            await healthStore.requestAuthorization()
            do {
                try await healthStore.calculateSteps()
            } catch {
                print(error)
            }
            
        }
        .padding()
        .navigationTitle("Step by Step")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
