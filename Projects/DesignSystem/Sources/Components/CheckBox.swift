//
//  CheckBox.swift
//  DesignSystem
//
//  Created by 김지수 on 2023/12/18.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

public struct CheckBox: View {
    //MARK: - Style
    public enum CheckBoxStyle {
        case square
        case circle
    }
    
    @Binding public var isSelect: Bool
    let style: CheckBoxStyle
    let size: CGFloat
    
    public init(
        isSelect: Binding<Bool> = .constant(false),
        style: CheckBoxStyle = .square,
        size: CGFloat = 24
    ) {
        self.style = style
        self.size = size
        self._isSelect = isSelect
    }
    
    var mainColor: Color {
        return isSelect ? .black : DesignSystem.Colors.gray400
    }
    
    var backgroundColor: Color {
        return isSelect ? .black : .clear
    }
    
    public var body: some View {
        ZStack {
            if style == .square {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(backgroundColor)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(mainColor, lineWidth: 1)
                            .foregroundStyle(.clear)
                    }
            } else {
                Circle()
                    .foregroundStyle(backgroundColor)
                    .overlay {
                        Circle()
                            .stroke(mainColor, lineWidth: 1)
                            .foregroundStyle(.clear)
                    }
            }
            Image(systemName: "checkmark")
                .resizable()
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .padding(3)
        }
        .frame(width: size, height: size)
        .onTapGesture {
            isSelect.toggle()
        }
    }
}

#Preview {
    CheckBox(isSelect: .constant(true), style: .circle, size: 16)
}
