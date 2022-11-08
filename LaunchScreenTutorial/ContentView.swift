import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    var body: some View {
        VStack {
            Image(systemName: "applescript")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 150, height: 150)
            Text("Hello, Apple Script!").font(.largeTitle)
            ZStack(alignment: .top) {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .alignmentGuide(VerticalAlignment.top) { $0[VerticalAlignment.center] }
                    .zIndex(1)
                
                VStack {
                    Text("You did it Leo ")
                        .font(.system(size: 28))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 100)
                    
                    Text("YOUR PRIZE")
                        .foregroundColor(.black)
                        .font(.caption2)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                    Text("+30 Points")
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .fontWeight(.heavy)
                    Text("+1 reject card")
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .fontWeight(.heavy)
                        .padding(.vertical,-15)
                        .padding(.bottom, 20)
                }
                .padding()
                .background {
                    Color.blue
                }
                .cornerRadius(8)
            }

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
