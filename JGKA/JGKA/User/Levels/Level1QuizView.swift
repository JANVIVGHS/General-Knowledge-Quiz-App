import SwiftUI

struct Level1QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer = ""
    @State private var score = 0
    @State private var showScoreView = false

    let questions = [
        ("What is the fastest land animal?", ["Cheetah", "Elephant", "Tiger", "Lion"], "Cheetah"),
        ("Which animal is known as the king of the jungle?", ["Lion", "Tiger", "Elephant", "Bear"], "Lion"),
        ("What do you call a baby kangaroo?", ["Joey", "Cub", "Calf", "Pup"], "Joey"),
        ("Which animal can live both in water and on land?", ["Frog", "Snake", "Horse", "Dog"], "Frog"),
        ("What animal is known for having a long neck?", ["Giraffe", "Elephant", "Monkey", "Zebra"], "Giraffe")
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
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
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
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .navigationTitle("Level 1 Quiz")
        .fullScreenCover(isPresented: $showScoreView) {
            Score1View(score: score, total: questions.count)
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
