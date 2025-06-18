import SwiftUI

struct Level2View: View {
    @State private var startQuiz = false
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Fun and Bold Title
            Text("🎉 Welcome to Level 2! 🎉")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.purple)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Description
            Text("Let's see how much you know about fruits!")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .foregroundColor(.green)
                .padding()
                .multilineTextAlignment(.center)
            
            // Fun Start Button
            Button(action: {
                startQuiz = true
            }) {
                Text("🍏 Start Quiz 🍌")
                    .font(.system(size: 28, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            }
            
            // Navigation link to start the quiz
            NavigationLink(destination: Level2QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
            
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.pink.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Level 2 - Fruits")
    }
}

struct Level2View_Previews: PreviewProvider {
    static var previews: some View {
        Level2View()
    }
}
