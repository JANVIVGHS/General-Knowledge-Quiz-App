import SwiftUI

struct Level3QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer = ""
    @State private var score = 0
    @State private var showScoreView = false

    let questions = [
        ("What shape has three sides?", ["Circle", "Triangle", "Square", "Rectangle"], "Triangle"),
        ("What shape has four equal sides?", ["Circle", "Triangle", "Square", "Rectangle"], "Square"),
        ("Which of these is a shape with no straight edges?", ["Circle", "Triangle", "Square", "Rectangle"], "Circle"),
        ("What shape has 5 sides?", ["Pentagon", "Hexagon", "Octagon", "Square"], "Pentagon"),
        ("Which shape is a type of quadrilateral?", ["Circle", "Triangle", "Square", "Rectangle"], "Rectangle")
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
        .navigationTitle("Level 3 Quiz - Shapes & Colors")
        .fullScreenCover(isPresented: $showScoreView) {
            Score3View(score: score, total: questions.count)
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

struct Level3QuizView_Previews: PreviewProvider {
    static var previews: some View {
        Level3QuizView()
    }
}
