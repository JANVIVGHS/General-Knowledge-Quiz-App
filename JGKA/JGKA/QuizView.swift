import SwiftUI

struct QuizView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // Level icons mapped to themes
    let levelIcons: [String] = [
        "icon_animals",
        "icon_fruits",
        "icon_shapes",
        "icon_space",
        "icon_colors",
        "icon_numbers"
    ]
    
    let levelNames: [String] = [
        "Animals", "Fruits", "Shapes", "Space", "Colors", "Numbers"
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Fun Title
                Text("Choose Your Quiz Level")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.purple)
                    .padding(.top, 30)
                    .multilineTextAlignment(.center)
                
                // Grid of quiz levels
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(0..<levelIcons.count, id: \.self) { index in
                        NavigationLink(destination: levelDestination(for: index + 1)) {
                            VStack(spacing: 10) {
                                // Fun Icon for the level
                                Image(levelIcons[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .overlay(
                                        Circle().stroke(Color.white, lineWidth: 4)
                                    )
                                
                                // Level number and name
                                Text("Level \(index + 1)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                                Text(levelNames[index])
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.8))
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 150, height: 150)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 4)
                            )
                            .padding(5)
                            .scaleEffect(1.05)
                            .animation(.spring(), value: 1)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.bottom)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.pink.opacity(0.4)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func levelDestination(for level: Int) -> some View {
        switch level {
        case 1: Level1View()
        case 2: Level2View()
        case 3: Level3View()
        case 4: Level4View()
        case 5: Level5View()
        case 6: Level6View()
        default: Text("Coming Soon!")
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
