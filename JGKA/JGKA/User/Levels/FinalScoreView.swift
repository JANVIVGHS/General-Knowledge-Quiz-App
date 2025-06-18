import SwiftUI

struct FinalScoreView: View {
    @AppStorage("score1") var score1 = 0
    @AppStorage("score2") var score2 = 0
    @AppStorage("score3") var score3 = 0
    @AppStorage("score4") var score4 = 0
    @AppStorage("score5") var score5 = 0
    @AppStorage("score6") var score6 = 0

    let totalPerLevel = 5 // Adjust if each level has different total

    var body: some View {
        let scores = [score1, score2, score3, score4, score5, score6]
        let totals = Array(repeating: totalPerLevel, count: 6)

        VStack(spacing: 20) {
            Spacer()

            Text("🎓 Final Quiz Scores 🎓")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)

            VStack(spacing: 15) {
                ForEach(0..<scores.count, id: \.self) { index in
                    HStack {
                        Text("Level \(index + 1):")
                            .font(.title3)
                            .foregroundColor(.blue)
                        Spacer()
                        Text("\(scores[index]) / \(totals[index])")
                            .font(.title3)
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal)
                }
            }

            let totalScore = scores.reduce(0, +)
            let totalMax = totals.reduce(0, +)

            Text("🏆 Total Score: \(totalScore) / \(totalMax)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding(.top, 30)

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.mint.opacity(0.3), Color.orange.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
    }
}
