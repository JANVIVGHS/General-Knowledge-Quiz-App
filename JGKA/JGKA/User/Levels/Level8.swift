import SwiftUI

struct Level8View: View {
    @State private var startQuiz = false

    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "pawprint.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Text("Welcome to the Animals Quiz!")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Let's test your knowledge about animals!")
                .font(.title2)
                .padding()

            Button(action: {
                startQuiz = true
            }) {
                Text("Start Quiz")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            NavigationLink(destination: Level8QuizView(), isActive: $startQuiz) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Level 8 - Animals")
    }
}
