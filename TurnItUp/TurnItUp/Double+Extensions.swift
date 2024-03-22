//
//  Double+Extensions.swift
//  TurnItUp
//
//  Created by Irlan Abushakhmanov on 22.03.2024.
//

import Foundation

extension Double {
    func сentering() -> CGFloat {
        switch true {
        case _ where self > 1: return 1
        case _ where self < 0: return 0
        default: return self
        }
    }
}
