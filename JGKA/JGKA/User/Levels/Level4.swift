import SwiftUI

struct Level4View: View {
    @State private var startQuiz = false

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Fun and Bold Title
            Text("🌟 Welcome to Level 4! 🚀")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.blue)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Description
            Text("Let's explore the universe together!")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Start Button
            Button(action: {
                startQuiz = true
            }) {
                Text("🚀 Start Quiz 🌙")
                    .font(.system(size: 28, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            }
            
            // Navigation link to start the quiz
            NavigationLink(destination: Level4QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
            
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Level 4 - Space")
    }
}
