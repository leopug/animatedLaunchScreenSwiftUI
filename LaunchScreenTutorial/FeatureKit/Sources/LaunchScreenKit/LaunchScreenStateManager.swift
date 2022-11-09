import Foundation

public final class LaunchScreenStateManager: ObservableObject {
    
    @MainActor
    @Published public var state: LaunchScreenStep = .firstStep
    
    public init() {}
    
    @MainActor
    public func dismiss() {
        state = .secondStep

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .finished
        }
    }
}
