import SwiftUI

struct Level7View: View {
    @State private var startQuiz = false

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
            
            Text("Welcome to the Space Quiz!")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Let's test your knowledge about space and planets!")
                .font(.title2)
                .padding()

            Button(action: {
                startQuiz = true
            }) {
                Text("Start Quiz")
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            NavigationLink(destination: Level7QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Level 7 - Space")
    }
}
