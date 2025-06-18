import SwiftUI

struct Level9QuizView: View {
    @State private var selectedAnswer = ""
    @State private var currentQuestionIndex = 0
    @State private var score = 0

    // Example questions for Level 9 (You can replace these with your own)
    let questions = [
        ("What is the capital of Japan?", ["Beijing", "Seoul", "Tokyo", "Kyoto"], "Tokyo"),
        ("Which continent is Brazil located on?", ["Asia", "Europe", "South America", "North America"], "South America"),
        ("What is the largest ocean on Earth?", ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"], "Pacific Ocean"),
        ("Which is the smallest country in the world?", ["Vatican City", "Monaco", "Liechtenstein", "San Marino"], "Vatican City"),
        ("Which country has the longest coastline?", ["Australia", "Canada", "Russia", "United States"], "Canada")
    ]
    
    var body: some View {
        VStack {
            Text(questions[currentQuestionIndex].0) // Display question
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

            Text("Score: \(score)") // Display score
                .font(.title)
                .padding()
            
            if currentQuestionIndex >= questions.count {
                Text("Quiz Completed!") // Show completion message
                    .font(.title2)
                    .bold()
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Level 9 Quiz")
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

struct Level9QuizView_Previews: PreviewProvider {
    static var previews: some View {
        Level9QuizView()
    }
}
