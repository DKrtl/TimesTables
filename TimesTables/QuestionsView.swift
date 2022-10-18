//
//  QuestionsView.swift
//  TimesTables
//
//  Created by Dogukan on 18/10/2022.
//

import SwiftUI

struct QuestionsView: View {
    let timesTable: Int
    private(set) var questionAmount: Int
    
    @State private var firstNum = 1
    @State private var secondNum = 1
    
    var body: some View {
        VStack {
            Text("\(firstNum) x \(secondNum)")
        }
    }
    
    func randomNumber(limit: Int) -> Int {
        Int.random(in: 1...limit)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(timesTable: 7, questionAmount: 5)
    }
}
