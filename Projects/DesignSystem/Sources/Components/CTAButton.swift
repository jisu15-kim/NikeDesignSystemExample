//
//  CTAButton.swift
//  DesignSystem
//
//  Created by 김지수 on 2023/12/14.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

public enum ComponentMode {
    case light
    case dark
}

fileprivate enum CTASolidButtonStyleConfig {
    case normal(ComponentMode)
    case pressed(ComponentMode)
    case disabled(ComponentMode)
    
    var backgroundColor: Color {
        switch self {
        case .normal(let mode), .pressed(let mode), .disabled(let mode):
            return mode == .dark ? .black : .white
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .normal(let mode):
            return mode == .dark ? .white : .black
        case .pressed(_), .disabled(_):
            return DesignSystem.gray400
        }
    }
}

public struct CTASolidButtonStyle: ButtonStyle {
    var mode: ComponentMode = .dark
    var width: CGFloat? = nil
    
    public init(mode: ComponentMode, width: CGFloat? = nil) {
        self.mode = mode
        self.width = width
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let state: CTASolidButtonStyleConfig = configuration.isPressed ? .pressed(mode) : .normal(mode)
        configuration.label
            .frame(width: width)
            .font(.medium.textXl)
            .foregroundColor(state.foregroundColor)
            .padding(.all, 16)
            .background(state.backgroundColor)
            .clipShape(Capsule())
    }
}

fileprivate enum CTAOutlineButtonStyleConfig {
    case normal(ComponentMode)
    case pressed(ComponentMode)
    case disabled(ComponentMode)
    
    var backgroundColor: Color {
        switch self {
        case .normal(_), .pressed(_), .disabled(_):
            return .clear
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .normal(let mode):
            return mode == .dark ? .black : .white
        case .pressed(_), .disabled(_):
            return DesignSystem.gray500
        }
    }
}

public struct CTAOutlineButtonStyle: ButtonStyle {
    var mode: ComponentMode = .dark
    var width: CGFloat? = nil
    
    public init(mode: ComponentMode, width: CGFloat? = nil) {
        self.mode = mode
        self.width = width
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let state: CTAOutlineButtonStyleConfig = configuration.isPressed ? .pressed(mode) : .normal(mode)
        configuration.label
            .frame(width: width)
            .font(.medium.textXl)
            .foregroundColor(state.foregroundColor)
            .padding(.all, 16)
            .background(state.backgroundColor)
            .overlay(
                Capsule()
                    .inset(by: 1)
                    .stroke(state.foregroundColor, lineWidth: 1)
            )
            .clipShape(Capsule())
    }
}

public struct CTAButton: View {
    
    let title: String
    var width: CGFloat? = nil
    var handler: (() -> Void)?
    
    @State var isSelected: Bool = false
    
    public init(
        title: String,
        width: CGFloat? = nil,
        handler: (() -> Void)? = nil
    ) {
        self.width = width
        self.title = title
        self.handler = handler
    }
    
    public var body: some View {
        Button {
            handler?()
        } label: {
            Text(title)
        }
        
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action: {
                print("버튼 클릭")
            }, label: {
                Text("아웃라인 버튼")
            })
            .buttonStyle(CTAOutlineButtonStyle(mode: .dark, width: 150))
            
            Button(action: {
                print("버튼 클릭")
            }, label: {
                Text("솔리드 버튼")
            })
            .buttonStyle(CTASolidButtonStyle(mode: .dark, width: 150))
        }
    }
}
