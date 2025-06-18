import SwiftUI

struct Level5View: View {
    @State private var startQuiz = false

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Fun and Bold Title
            Text("🐾 Welcome to Level 5! 🦁")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.green)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Description
            Text("Let's test your knowledge about animals!")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .foregroundColor(.brown)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Start Button
            Button(action: {
                startQuiz = true
            }) {
                Text("🐯 Start Quiz 🦓")
                    .font(.system(size: 28, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            }
            
            // Navigation link to start the quiz
            NavigationLink(destination: Level5QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
            
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.3), Color.brown.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Level 5 - Animals")
    }
}
