import SwiftUI

struct Level2QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer = ""
    @State private var score = 0
    @State private var showScoreView = false

    let questions = [
        ("What is the color of a ripe banana?", ["Yellow", "Green", "Red", "Purple"], "Yellow"),
        ("Which fruit is known for being orange?", ["Orange", "Apple", "Grape", "Pineapple"], "Orange"),
        ("What fruit is often associated with keeping doctors away?", ["Apple", "Banana", "Peach", "Grapefruit"], "Apple"),
        ("Which fruit has a spiky outer layer and sweet inside?", ["Pineapple", "Mango", "Avocado", "Coconut"], "Pineapple"),
        ("Which fruit is the main ingredient in guacamole?", ["Avocado", "Tomato", "Onion", "Lime"], "Avocado")
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
        .navigationTitle("Level 2 Quiz - Fruits")
        .fullScreenCover(isPresented: $showScoreView) {
            Score2View(score: score, total: questions.count)
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

struct Level2QuizView_Previews: PreviewProvider {
    static var previews: some View {
        Level2QuizView()
    }
}
