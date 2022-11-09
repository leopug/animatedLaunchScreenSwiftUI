import SwiftUI
import LaunchScreenKit

public struct ContentView: View {
    
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "applescript")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 150, height: 150)
            
            Text("Hello, Apple Script!").font(.largeTitle)
        }
        .padding()
        .task {
            try? await getDataFromApi()
            try? await Task.sleep(for: Duration.seconds(1))
            
            self.launchScreenState.dismiss()
        }
    }
    
    fileprivate func getDataFromApi() async throws {
        let googleURL = URL(string: "https://www.google.com")!
        let (_,response) = try await URLSession.shared.data(from: googleURL)
        print(response as? HTTPURLResponse)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenStateManager())
    }
}
