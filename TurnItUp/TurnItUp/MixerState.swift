//
//  MixerState.swift
//  TurnItUp
//
//  Created by Irlan Abushakhmanov on 22.03.2024.
//

import Foundation

enum MixerState {
    case maximim
    case minimum
    case inside

    var offset: CGFloat {
        switch self {
        case .inside: .zero
        case .maximim: -16
        case .minimum: 16
        }
    }

    var height: CGFloat {
        switch self {
        case .inside: 210
        case .maximim, .minimum: 230
        }
    }

    var width: CGFloat {
        switch self {
        case .inside: 100
        case .maximim, .minimum: 90
        }
    }

    mutating func updateState(for offset: CGFloat) {
        switch true {
        case _ where offset == 1: self = .maximim
        case _ where offset == 0: self = .minimum
        default: return
        }
    }
}
