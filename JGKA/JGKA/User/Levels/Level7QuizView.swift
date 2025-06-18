import SwiftUI

struct Level7QuizView: View {
    @State private var selectedAnswer = ""
    @State private var currentQuestionIndex = 0
    @State private var score = 0

    let questions = [
        ("What is the name of the first manned mission to land on the Moon?", ["Apollo 11", "Gemini 3", "Apollo 13", "Soyuz 11"], "Apollo 11"),
        ("Which planet is known as the Red Planet?", ["Mars", "Venus", "Saturn", "Jupiter"], "Mars"),
        ("What is the largest planet in our solar system?", ["Jupiter", "Saturn", "Earth", "Neptune"], "Jupiter"),
        ("What is the name of the galaxy that contains Earth?", ["Milky Way", "Andromeda", "Triangulum", "Whirlpool"], "Milky Way"),
        ("What is the closest planet to the Sun?", ["Mercury", "Venus", "Earth", "Mars"], "Mercury")
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
                        .background(Color.purple.opacity(0.6))
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
        .navigationTitle("Level 7 Quiz")
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
