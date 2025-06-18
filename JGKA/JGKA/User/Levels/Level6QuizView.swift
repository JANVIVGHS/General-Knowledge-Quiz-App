import SwiftUI

struct Level6QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer = ""
    @State private var score = 0
    @State private var showScoreView = false

    let questions = [
        ("What is the capital of France?", ["Paris", "Berlin", "Rome", "Madrid"], "Paris"),
        ("Which country is known as the Land of the Rising Sun?", ["Japan", "China", "India", "Korea"], "Japan"),
        ("What is the largest country by area?", ["Russia", "China", "USA", "Canada"], "Russia"),
        ("Which river is the longest in the world?", ["Nile", "Amazon", "Yangtze", "Mississippi"], "Nile"),
        ("Which country is home to the Great Barrier Reef?", ["Australia", "New Zealand", "USA", "Mexico"], "Australia")
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
        .navigationTitle("Level 6 Quiz - Geography")
        .fullScreenCover(isPresented: $showScoreView) {
            Score6View(score: score, total: questions.count)
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

struct Level6QuizView_Previews: PreviewProvider {
    static var previews: some View {
        Level6QuizView()
    }
}
