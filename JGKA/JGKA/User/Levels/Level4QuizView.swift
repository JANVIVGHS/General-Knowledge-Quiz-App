import SwiftUI

struct Level4QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer = ""
    @State private var score = 0
    @State private var showScoreView = false

    let questions = [
        ("What is the closest planet to the Sun?", ["Earth", "Mars", "Venus", "Mercury"], "Mercury"),
        ("Which planet is known as the Red Planet?", ["Earth", "Mars", "Jupiter", "Saturn"], "Mars"),
        ("What is the largest planet in our solar system?", ["Earth", "Saturn", "Jupiter", "Neptune"], "Jupiter"),
        ("Which planet has rings around it?", ["Earth", "Mars", "Saturn", "Uranus"], "Saturn"),
        ("What is the name of our galaxy?", ["Andromeda", "Milky Way", "Whirlpool", "Triangulum"], "Milky Way")
    ]

    var body: some View {
        VStack(spacing: 20) {
            if currentQuestionIndex < questions.count {
                Text("Question \(currentQuestionIndex + 1)")
                    .font(.title2)
                    .foregroundColor(.purple)

                Text(questions[currentQuestionIndex].0)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()

                // Answer Buttons
                ForEach(questions[currentQuestionIndex].1, id: \.self) { option in
                    Button(action: {
                        selectedAnswer = option
                        checkAnswer()
                    }) {
                        Text(option)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal)
                    }
                }

                // Show View Score button only on the last question
                if currentQuestionIndex == questions.count - 1 {
                    Button(action: {
                        showScoreView = true
                    }) {
                        Text("🎉 View Score 🎉")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .navigationTitle("Level 4 Quiz - Space")
        .fullScreenCover(isPresented: $showScoreView) {
            Score4View(score: score, total: questions.count)
        }
    }

    func checkAnswer() {
        if selectedAnswer == questions[currentQuestionIndex].2 {
            score += 1
        }
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
        selectedAnswer = ""
    }
}

struct Level4QuizView_Previews: PreviewProvider {
    static var previews: some View {
        Level4QuizView()
    }
}
