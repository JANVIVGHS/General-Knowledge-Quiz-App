import SwiftUI

struct Level9View: View {
    @State private var startQuiz = false

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "applelogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            Text("Welcome to the Fruits Quiz!")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Let's test your knowledge about fruits!")
                .font(.title2)
                .padding()

            Button(action: {
                startQuiz = true
            }) {
                Text("Start Quiz")
                    .font(.title)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            NavigationLink(destination: Level9QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Level 9 - Fruits")
    }
}
