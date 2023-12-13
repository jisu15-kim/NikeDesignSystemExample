//
//  CTAButton.swift
//  DesignSystem
//
//  Created by 김지수 on 2023/12/14.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

public struct CTAButton: View {
    
    let title: String
    var handler: (() -> Void)?
    
    @State var isSelected: Bool = false
    
    public init(
        title: String,
        handler: (() -> Void)? = nil
    ) {
        self.title = title
        self.handler = handler
    }
    
    public var body: some View {
        HStack {
          Spacer()
            .frame(width: 20)
          
          HStack {
            Spacer()
            
            Text(title)
                  .font(.system(size: 16, weight: .medium))
                  .foregroundColor(.black)
            
            Spacer()
          }
          .frame(height: 56)
          .background(DesignSystemAsset.gray200.swiftUIColor)
          .clipShape(Capsule())
          .gesture(
            DragGesture(minimumDistance: 0)
              .onChanged { _ in
                isSelected = true
              }
              .onEnded { _ in
                isSelected = false
                handler?()
              }
          )
          
          Spacer()
            .frame(width: 20)
        }
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        CTAButton(title: "버튼이요") {
            print("클릭이요")
        }
    }
}
