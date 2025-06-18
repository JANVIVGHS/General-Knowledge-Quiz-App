import SwiftUI

struct Score6View: View {
    let score: Int
    let total: Int

    @AppStorage("score6") var score6 = 0
    @State private var goToNextLevel = false
    @State private var goToAllLevels = false
    @State private var goToFinalScore = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()

                VStack(spacing: 20) {
                    Text("🎉 Quiz Completed! 🎉")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)

                    Text("You scored \(score) out of \(total)")
                        .font(.title)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                }

                VStack(spacing: 20) {
                    // Navigation to Next Level (future use)
                    NavigationLink(destination: Text("Next Level Coming Soon!"), isActive: $goToNextLevel) {
                        EmptyView()
                    }
                    Button(action: {
                        goToNextLevel = true
                    }) {
                        Text("➡️ Next Level (Coming Soon!)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal)
                    }

                    // Navigation to All Levels
                    NavigationLink(destination: QuizView(), isActive: $goToAllLevels) {
                        EmptyView()
                    }
                    Button(action: {
                        goToAllLevels = true
                    }) {
                        Text("🔙 Back to All Levels")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal)
                    }

                    // Navigation to Final Score View
                    NavigationLink(destination: FinalScoreView(), isActive: $goToFinalScore) {
                        EmptyView()
                    }
                    Button(action: {
                        goToFinalScore = true
                    }) {
                        Text("📊 View All Level Scores")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal)
                    }
                }

                Spacer()
            }
            .padding()
            .onAppear {
                score6 = score
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.2), Color.cyan.opacity(0.2)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}
