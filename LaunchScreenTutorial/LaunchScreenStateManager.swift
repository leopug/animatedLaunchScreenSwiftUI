import Foundation

final class LaunchScreenStateManager: ObservableObject {
    
    @MainActor
    @Published private(set) var state: LaunchScreenStep = .firstStep
    
    @MainActor
    func dismiss() {
        state = .secondStep

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .finished
        }
    }
}
