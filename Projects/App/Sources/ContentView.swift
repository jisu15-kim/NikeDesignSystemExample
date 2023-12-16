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
                errorMeeage: "에러에요"
            )
            .frame(width: 250, height: 60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
