//
//  InfoBox.swift
//  DesignSystem
//
//  Created by Jisu Kim on 2023/12/21.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

public struct InfoBox: View {
    
    private var dataSource = [InfoBoxDataModel]()
    @State var currentIndex = 0 {
        didSet {
            print(currentIndex)
        }
    }
    
    var size: CGSize?
    let titleFont: Font
    let bodyFont: Font
    let titleColor: Color
    let bodyColor: Color
    
    public init(
        dataSource: [InfoBoxDataModel] = [],
        size: CGSize? = nil,
        titleFont: Font = .medium.textXl,
        bodyFont: Font = .regular.textLg,
        titleColor: Color = .black,
        bodyColor: Color = .black
    ) {
        self.dataSource = InfoBoxDataModel.getMockup()
        self.size = size
        self.titleFont = titleFont
        self.bodyFont = bodyFont
        self.titleColor = titleColor
        self.bodyColor = bodyColor
    }
    
    public var body: some View {
        ZStack(alignment: .bottomLeading) {
            // 탭뷰
            TabView(selection: $currentIndex) {
                ForEach(0..<dataSource.count, id: \.self) { index in
                    let data = dataSource[index]
                    ZStack {
                        DesignSystem.Colors.gray100
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(data.title)
                                    .font(.medium.textXl)
                                Text(data.description)
                                    .font(.regular.textLg)
                                Spacer()
                            }
                            Spacer()
                        }
                        .frame(width: .infinity, height: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 18)
                    }
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    .backgroundStyle(.red)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // 인디케이터
            HStack(spacing: 3) {
                ForEach(0..<dataSource.count, id: \.self) { index in
                    
                    let isCurrentPage = index == currentIndex
                    let color: Color = isCurrentPage ? .black : DesignSystem.Colors.gray300
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .foregroundStyle(color)
                            .frame(width: 12, height: 2)
                    }
                }
            }
            .padding(.leading, 20)
            .padding(.bottom, 18)
        }
        .frame(minHeight: 150)
        .frame(width: size?.width, height: size?.height)
        .padding(.all, 10)

    }
}

#Preview {
    InfoBox()
}

public struct InfoBoxDataModel: Hashable {
    var title: String
    var description: String
    
    public static func getMockup() -> [InfoBoxDataModel] {
        return [
            InfoBoxDataModel(title: "안녕", description: "오우오오오"),
            InfoBoxDataModel(title: "안녕하세요", description: "SwiftUI를 해볼께요\n그런데길게쓰면\n어떻게될까요"),
            InfoBoxDataModel(title: "케케케", description: "로로 Xcode 만세"),
            InfoBoxDataModel(title: "중요한정보", description: "가져가세요"),
        ]
    }
}
