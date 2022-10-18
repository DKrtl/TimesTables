//
//  ContentView.swift
//  TimesTables
//
//  Created by Dogukan on 18/10/2022.
//

import SwiftUI

struct ContentView: View {
    let questionAmounts = [5, 10, 20]
    
    @State private var active = false
    @State private var timesTable = 1
    @State private var questionAmount = 5
    
    var body: some View {
        VStack {
            Text("Times Tables")
                .font(.largeTitle.bold())
            
            if active {
                Text("hjkl")
            } else {
                Form {
                    Section("Highest Multiple") {
                        Stepper("Up to \(timesTable)", value: $timesTable, in: 1...12)
                    }
                    
                    Section("Total Questions") {
                        Picker("Questions", selection: $questionAmount) {
                            ForEach(questionAmounts, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button("Submit") {
                            active = true
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
