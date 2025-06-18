import SwiftUI

struct Level10QuizView: View {
    @State private var selectedAnswer = ""
    @State private var currentQuestionIndex = 0
    @State private var score = 0

    let questions = [
        ("Which planet is known as the Red Planet?", ["Earth", "Mars", "Venus", "Jupiter"], "Mars"),
        ("What is the name of the first human to walk on the Moon?", ["Neil Armstrong", "Buzz Aldrin", "Yuri Gagarin", "John Glenn"], "Neil Armstrong"),
        ("What is the closest star to Earth?", ["Proxima Centauri", "The Sun", "Alpha Centauri", "Sirius"], "The Sun"),
        ("Which planet is the largest in our solar system?", ["Earth", "Mars", "Jupiter", "Saturn"], "Jupiter"),
        ("What is the name of the galaxy that contains our solar system?", ["Andromeda", "Milky Way", "Triangulum", "Whirlpool"], "Milky Way")
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
                    checkAnswer(answer: option)
                }) {
                    Text(option)
                        .font(.title2)
                        .padding()
                        .background(Color.indigo.opacity(0.6))
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
        .navigationTitle("Level 10 Quiz")
    }

    // Function to check the selected answer and update the score
    private func checkAnswer(answer: String) {
        if answer == questions[currentQuestionIndex].2 {
            score += 1  // Correct answer, increment score
        }
        
        // Move to the next question or end the quiz if all questions are answered
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // Quiz completed, you can handle the result here, e.g., show a completion message
            print("Quiz Completed! Final Score: \(score)")
        }
    }
}
