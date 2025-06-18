import SwiftUI

struct Score2View: View {
    let score: Int
    let total: Int
    @State private var goToNextLevel = false
    @State private var goToAllLevels = false

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
                    // Navigation to Next Level
                    NavigationLink(destination: Level3View(), isActive: $goToNextLevel) {
                        EmptyView()
                    }
                    Button(action: {
                        goToNextLevel = true
                    }) {
                        Text("➡️ Next Level")
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
                }

                Spacer()
            }
            .padding()
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

struct Score2View_Previews: PreviewProvider {
    static var previews: some View {
        Score2View(score: 4, total: 5)
    }
}
