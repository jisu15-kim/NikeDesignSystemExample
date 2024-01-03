//
//  TabbarView.swift
//  Main
//
//  Created by Jisu Kim on 2023/12/23.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct TabbarView: View {
    
    public init() {
//        UITabBar.appearance().backgroundColor = DesignSystem.gray200.uiColor
    }
    
    public var body: some View {
        TabView {
            Discover()
                .padding(.all, 1)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.bold.textXs)
                }
            Text("Shop")
                .tabItem {
                    Image(systemName: "rectangle.and.text.magnifyingglass")
                    Text("Shop")
                        .font(.bold.textXs)
                }
            Text("Favourites")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                        .font(.bold.textXs)
                }
            Text("Bag")
                .tabItem {
                    Image(systemName: "bag")
                    Text("Bag")
                        .font(.bold.textXs)
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                        .font(.bold.textXs)
                }
        }
        .tint(.black)
    }
}

#Preview {
    TabbarView()
}
