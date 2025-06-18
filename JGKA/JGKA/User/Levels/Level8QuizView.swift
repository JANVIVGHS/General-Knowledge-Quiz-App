import SwiftUI

struct Level8QuizView: View {
    @State private var selectedAnswer = ""
    @State private var currentQuestionIndex = 0
    @State private var score = 0

    let questions = [
        ("What is the largest land animal?", ["Elephant", "Giraffe", "Whale", "Rhino"], "Elephant"),
        ("Which animal is known as the King of the Jungle?", ["Lion", "Tiger", "Elephant", "Bear"], "Lion"),
        ("What type of animal is a Komodo dragon?", ["Reptile", "Mammal", "Bird", "Fish"], "Reptile"),
        ("Which bird can mimic human speech?", ["Parrot", "Eagle", "Penguin", "Owl"], "Parrot"),
        ("What is the fastest land animal?", ["Cheetah", "Lion", "Elephant", "Horse"], "Cheetah")
    ]
    
    var body: some View {
        VStack {
            Text(questions[currentQuestionIndex].0)
                .font(.title)
                .bold()
                .padding()

            ForEach(questions[currentQuestionIndex].1, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    checkAnswer()
                }) {
                    Text(option)
                        .font(.title2)
                        .padding()
                        .background(Color.green.opacity(0.6))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(5)
                }
            }
            
            Spacer()

            Text("Score: \(score)")
                .font(.title)
                .padding()
            
            if currentQuestionIndex >= questions.count {
                Text("Quiz Completed!")
                    .font(.title2)
                    .bold()
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Level 8 Quiz")
    }

    func checkAnswer() {
        if selectedAnswer == questions[currentQuestionIndex].2 {
            score += 1
        }
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }
}
