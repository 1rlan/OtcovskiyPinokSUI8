//
//  ContentView.swift
//  TurnItUp
//
//  Created by Irlan Abushakhmanov on 22.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .yellow], startPoint: .top, endPoint: .bottom)
            Mixer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
