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
    @State public var isError: Bool = false
    
    var placeHolder: String = ""
    var errorMeeage: String?
    
    var mainColor: Color {
        return isError == true ? DesignSystem.error500 : DesignSystem.gray600
    }
    
    public init(textInput: Binding<String>,
         placeHolder: String = "",
         errorMeeage: String? = nil
    ) {
        self._textInput = textInput
        self.errorMeeage = errorMeeage
        self.placeHolder = placeHolder
    }
    
    public var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 6)
                
                ZStack {
                    TextField(placeHolder, text: $textInput)
                        .font(.regular.text2xl)
                        .padding(.horizontal, 10)
                }
                .frame(height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 1)
                        .stroke(mainColor, lineWidth: 1)
                        .foregroundColor(.clear)
                    )
                
                if let errorMeeage {
                    HStack {
                        Text(errorMeeage)
                            .font(.regular.textSm)
                            .foregroundColor(mainColor)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            if !textInput.isEmpty && placeHolder != "" {
                VStack {
                    HStack {
                        Text(placeHolder)
                            .padding(.horizontal, 2)
                            .font(.regular.textSm)
                            .foregroundColor(DesignSystem.gray600)
                            .frame(height: 12, alignment: .topLeading)
                            .background(Color.white)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal, 8)
//                .frame(width: .infinity, height: .infinity, alignment: .topLeading)
            }
        }
    }
}

struct StandAlongInputView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
//        VStack(spacing: 20) {
//            StandAlongInputView()
//                .frame(width: 250, height: 60)
//            
//            StandAlongInputView(
//                textInput: "안녕하신가",
//                placeHolder: "플레이스홀더",
//                errorMeeage: "에러에요"
//            )
//            .frame(width: 250, height: 60)
//        }
    }
}
