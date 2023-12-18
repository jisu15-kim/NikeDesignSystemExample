//
//  ContentView.swift
//  App
//
//  Created by 김지수 on 2023/12/14.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI
import DesignSystem


struct ContentView: View {
    @State var isCheckBoxState: Bool = false
    @State var isTextInputError: Bool = false
    @State var inputText: String = "" {
        didSet {
            print(inputText)
        }
    }
    
    var body: some View {
        
        
        VStack(spacing: 24) {
            Button {
                print("아웃라인 버튼")
            } label: {
                Text("아웃라인 버튼")
            }
            .buttonStyle(CTAOutlineButtonStyle(mode: .dark, width: 150))
            
            Button(action: {
                print("버튼 클릭")
            }, label: {
                Text("솔리드 버튼")
            })
            .buttonStyle(CTASolidButtonStyle(mode: .dark, width: 150))
            
            StandAlongInputView(
                textInput: $inputText,
                placeHolder: "플레이스홀더",
                errorMeeage: "에러에요",
                isError: $isTextInputError
            )
            .frame(width: 250, height: 60)
            
            Button(action: {
                isTextInputError.toggle()
            }, label: {
                Text("텍스트 인풋 에러 전환")
            })
            
            HStack(spacing: 5) {
                CheckBox(
                    isSelect: $isCheckBoxState,
                    style: .square,
                    size: 16
                )
                Text("오늘 공부 하셨나요")
                    .font(.regular.textMd)
                    .foregroundStyle(
                        isCheckBoxState ? .black : DesignSystem.gray600
                    )
                    .onTapGesture {
                        isCheckBoxState.toggle()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
