import SwiftUI

struct Level10View: View {
    @State private var startQuiz = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.indigo)
            
            Text("Welcome to the Space Quiz!")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Let's test your knowledge about space!")
                .font(.title2)
                .padding()
            
            Button(action: {
                startQuiz = true
            }) {
                Text("Start Quiz")
                    .font(.title)
                    .padding()
                    .background(Color.indigo)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            NavigationLink(destination: Level10QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Level 10 - Space")
    }
}
