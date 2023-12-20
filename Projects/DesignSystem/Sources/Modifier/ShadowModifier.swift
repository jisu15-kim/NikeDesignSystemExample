//
//  ShadowModifier.swift
//  DesignSystem
//
//  Created by Jisu Kim on 2023/12/21.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

public extension View {
    func shadow(_ type: ShadowType) -> some View {
        modifier(ShadowModifier(type: type))
    }
}

public enum ShadowType {
    case xs
    case sm
    case md
    case lg
    case xl_1
    case xl_2
    case xl_3
}

private struct ShadowModifier: ViewModifier {
    
    let type: ShadowType
    
    func body(content: Content) -> some View {
        switch type {
        case .xs:
            content
                .shadow(color: .black.opacity(0.4), radius: 1, x: 0, y: 1)
        case .sm:
            content
                .shadow(color: .black.opacity(0.4), radius: 1.5, x: 0, y: 1)
        case .md:
            content
                .shadow(color: .black.opacity(0.35), radius: 4, x: 0, y: 4)
        case .lg:
            content
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
        case .xl_1:
            content
                .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 20)
        case .xl_2:
            content
                .shadow(color: .black.opacity(0.3), radius: 24, x: 0, y: 24)
        case .xl_3:
            content
                .shadow(color: .black.opacity(0.4), radius: 32, x: 0, y: 32)
        }
    }
}
