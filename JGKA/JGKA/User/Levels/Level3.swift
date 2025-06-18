import SwiftUI

struct Level3View: View {
    @State private var startQuiz = false

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Fun and Bold Title
            Text("🔺 Welcome to Level 3! 🔵")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.orange)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Description
            Text("Let's test your knowledge of shapes and colors!")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Start Button
            Button(action: {
                startQuiz = true
            }) {
                Text("🔵 Start Quiz 🔺")
                    .font(.system(size: 28, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            }
            
            // Navigation link to start the quiz
            NavigationLink(destination: Level3QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
            
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.blue.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Level 3 - Shapes & Colors")
    }
}
