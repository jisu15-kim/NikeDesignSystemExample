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
    var body: some View {
        CTAButton(title: "버튼이에요") {
            print("버튼눌림")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
