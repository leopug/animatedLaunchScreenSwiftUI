import SwiftUI

public struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager

    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    public init() {}
    
    @ViewBuilder
    private var image: some View {
        Image(systemName: "hurricane")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(firstAnimation ? Angle(degrees: 0) : Angle(degrees: 1200))
            .scaleEffect(secondAnimation ? 0 : 1)
            .offset(y: secondAnimation ? 400 : 0)
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.orange.ignoresSafeArea()
    }
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    public var body: some View {
        ZStack {
            backgroundColor
            image
        }.onReceive(animationTimer) { timerValue in
            updateAnimation()
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}
