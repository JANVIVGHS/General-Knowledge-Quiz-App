import SwiftUI

struct Level1View: View {
    @State private var isReady = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.green.opacity(0.3)]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    VStack(spacing: 20) {
                        Text("Level 1: Animals")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.green)

                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)

                        Text("Are you ready for the quiz?")
                            .font(.title2)
                            .foregroundColor(.orange)

                        NavigationLink(destination: Level1QuizView(), isActive: $isReady) {
                            Button(action: {
                                isReady = true
                            }) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                        .font(.title2)
                                    Text("Start Quiz")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(.horizontal)
                                .shadow(radius: 5)
                            }
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct Level1View_Previews: PreviewProvider {
    static var previews: some View {
        Level1View()
    }
}
