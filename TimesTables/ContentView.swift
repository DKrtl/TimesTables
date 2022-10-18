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
    
    @State private var firstNum = 1
    @State private var secondNum = 1
    @State private var answer: Int? = nil
    
    @State private var pointsCounter = 0
    
    @State private var showingResult = false
    @State private var resultTitle = ""
    
    @FocusState private var answerIsFocused: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Times Tables")
                .font(.largeTitle.bold())
            
            Section {
                if active {
                    VStack {
                        Form {
                            Section {
                                HStack {
                                    Spacer()
                                    
                                    Text("\(firstNum) x \(secondNum)")
                                        .font(.title.bold())
                                    
                                    Spacer()
                                }
                            }
                            
                            Section {
                                TextField("Answer", value: $answer, format: .number)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.decimalPad)
                                    .focused($answerIsFocused)
                            }
                        }
                    }
                    .alert(resultTitle, isPresented: $showingResult) {
                        Button("Continue") {
                            
                        }
                    }
                    .safeAreaInset(edge: .bottom) {
                        VStack {
                            Text("Score")
                                .font(.headline.bold())
                            Text("\(pointsCounter)")
                                .font(.largeTitle)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                    }
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
                                newQuestion()
                            }

                            Spacer()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        answerSubmitted()
                        answerIsFocused = false
                    }
                }
            }
        }
    }
    
    func randomNumber(limit: Int) -> Int {
        Int.random(in: 1...limit)
    }
    
    func answerIsCorrect() -> Bool {
        answer == firstNum * secondNum
    }
    
    func newQuestion() {
        firstNum = randomNumber(limit: timesTable)
        secondNum = randomNumber(limit: 12)
        answer = nil
    }
    
    func answerSubmitted() {
        if answerIsCorrect() {
            pointsCounter += 1
            resultTitle = "Correct"
        } else {
            resultTitle = "Incorrect"
        }
        newQuestion()
        
        showingResult = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
