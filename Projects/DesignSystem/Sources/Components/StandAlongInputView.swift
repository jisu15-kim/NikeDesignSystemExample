//
//  StandAlongInputView.swift
//  DesignSystem
//
//  Created by Jisu Kim on 2023/12/17.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

public struct StandAlongInputView: View {
    
    @Binding public var textInput: String
    @Binding public var isError: Bool
    
    var placeHolder: String = ""
    var errorMeeage: String?
    var rightIconImage: Image?
    var mainColor: Color {
        return isError == true ? DesignSystem.error500 : DesignSystem.gray600
    }
    
    public init(textInput: Binding<String>,
                rightIconImage: Image? = nil,
                placeHolder: String = "",
                errorMeeage: String? = nil,
                isError: Binding<Bool> = .constant(false)
    ) {
        self._textInput = textInput
        self._isError = isError
        self.rightIconImage = rightIconImage
        self.errorMeeage = errorMeeage
        self.placeHolder = placeHolder
    }
    
    public var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 6)
                
                ZStack {
                    HStack {
                        TextField(placeHolder, text: $textInput)
                            .font(.regular.text2xl)
                        
                        if let rightIconImage {
                            rightIconImage
                        }
                    }
                    .padding(.horizontal, 10)
                    .foregroundStyle(mainColor)
                }
                .frame(height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 1)
                        .stroke(mainColor, lineWidth: 1)
                        .foregroundColor(.clear)
                    )
                
                if let errorMeeage, isError == true {
                    HStack {
                        Text(errorMeeage)
                            .font(.regular.textSm)
                            .foregroundColor(mainColor)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .frame(height: 12)
                } else {
                    Spacer()
                        .padding(.horizontal, 10)
                        .frame(height: 12)
                }
            }
            
            if !textInput.isEmpty && placeHolder != "" {
                VStack {
                    HStack {
                        Text(placeHolder)
                            .padding(.horizontal, 2)
                            .font(.regular.textSm)
                            .foregroundColor(mainColor)
                            .frame(height: 12, alignment: .topLeading)
                            .background(Color.white)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

struct StandAlongInputView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack(spacing: 24) {
            
            StandAlongInputView(
                textInput: .constant("Value"),
                rightIconImage: Image(systemName: "eye"),
                placeHolder: "플레이스홀더",
                errorMeeage: "에러에요",
                isError: .constant(false)
            )
            .frame(width: 250, height: 60)
        }
    }
}
