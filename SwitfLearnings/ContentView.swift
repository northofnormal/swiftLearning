//
//  ContentView.swift
//  SwitfLearnings
//
//  Created by Anne Cahalan on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            viewModel.fetchWeather()
        }

        //TO Do:
        // Some UI
        // Input lat/long - for getting user's location:  https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-the-users-location-using-locationbutton
        // user device direction/compass:
        // https://developer.apple.com/documentation/corelocation/cllocationdirection
        // look up sfsymbols 
        // loading spinner or something
    }
}

class ContentViewModel: ObservableObject {
    @Published var weather: Weather? = nil

    func fetchWeather() {
        Task{
            weather = try? await API.shared.fetchWeather()
        }
    }
}

#Preview {
    ContentView()
}
