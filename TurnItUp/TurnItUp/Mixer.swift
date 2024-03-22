//
//  Mixer.swift
//  TurnItUp
//
//  Created by Irlan Abushakhmanov on 22.03.2024.
//

import SwiftUI

struct Mixer: View {
    @State private var state = MixerState.inside
    @State private var progress = Double.zero
    @State private var lastProgress = Double.zero

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                Rectangle()
                    .foregroundColor(.white)
                    .scaleEffect(y: progress, anchor: .bottom)
            }
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .gesture(makeGesture(height: proxy.size.height))
        }
        .offset(y: state.offset)
        .frame(width: state.width, height: state.height)
    }

    private func makeGesture(height: Double) -> some Gesture {
        DragGesture()
        .onChanged { gesture in
            let verticalOffset = gesture.startLocation.y - gesture.location.y
            progress = (lastProgress + (verticalOffset / height)).сentering()
            startAnimation()
        }.onEnded { _ in
            endAnimation()
        }
    }

    private func startAnimation() {
        withAnimation {
            state.updateState(for: progress)
        }
    }

    private func endAnimation() {
        withAnimation {
            state = .inside
            lastProgress = progress
        }
    }
}

#Preview {
    Mixer()
}
