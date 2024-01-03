//
//  Discover.swift
//  Main
//
//  Created by Jisu Kim on 2023/12/23.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI
import DesignSystem

fileprivate enum DiscoverImage {
    static let headerImage = "https://s3-alpha-sig.figma.com/img/bb35/1e19/e79d34332ea94a41ed8cd1c4f14fcd64?Expires=1704067200&Signature=QyY1w1NVtGFZ8Yl1FwYnZTTwYphZNzmwW~mA8vYQyOxbKjfIlDgFdRG3YJINxhErQvSRwY4vD02WFOMbpakom1ebnJmKlS3RCsydl6mUhY9ACQALtp-Wnk6GWKF1sgzyqJbwsLVLZ7Roqzl6VXfr34cEbMdpElu7D4Eh2ypRxqkVb9SFbpQJ1kwfhPySfhzdNOtOpczYKk7kv4caNZgzw91dPXR-qK~~kDnb3OFwQd-UQSupIrz~oMM0oqLJ-9KPovN-kcR5GVh-jWxor6QN3PKfko3BO-NZSyEMm8lNg~pMv6ft8CDjtZPzHGnpyc9G8a3YJ6jy19cD9DoWekDhqg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
 
}

fileprivate struct NewArrivalItem: HPaginable {
    var id: Int
    let name: String
    let price: String
    var image: URL?
    
    static func getMockup() -> [Self] {
        var items = [NewArrivalItem]()
        for i in 0...3 {
            let item = NewArrivalItem(
                id: i,
                name: "Air Jordan XXXVI",
                price: "US$185",
                image: URL(string: "https://s3-alpha-sig.figma.com/img/6881/6fee/e61ad123691ab5a8dbc4d2aebb0d0c20?Expires=1704672000&Signature=hgqqUFc9VoTcnRcTGW7Pe10xpKKx8W~~56Q~fw-pKR~yM457o7jUsBVUmnr-ELjo7FjYyC8b4r-KJA5k8DKiM28F12mBPA-vJ9Ppsdu75elWiHDPXmOjUR2Oj3iIh1ZRAOlhx7EJr-la~8Frpb3xGxeFxWrAQ2wpqYKcVX1DCr8SQmvxObRbjrCfNq2R53UlOJ04J4X2UI6LQkZTjfmIEvMLz9dwEJ3DWcfglsaULlItErmTi826on5egZD1c0X3KZafg50iH4PZY9KjBOuC3zrFD-OH8OE0UjerB5l7yRI4uNBRGoLI11YARYcD9MdZgfDeCJEpL122sBHvkSAOtA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"))
            items.append(item)
        }
        return items
    }
}

struct Discover: View {
    var body: some View {
        ScrollView {
            VStack {
                //MARK: 헤더 부분
                HStack {
                    VStack(spacing: 10) {
                        Text("Discover")
                            .font(.medium.displayXl)
                        Text("Tuesday, 3 May")
                            .font(.regular.text2xl)
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 50)
                
                //MARK: 이미지
                AsyncImage(url: URL(string: DiscoverImage.headerImage)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                
                //MARK: 헤더
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("What's new")
                            .font(.medium.text2xl)
                        
                        Text("The latest arrivals from Nike")
                            .font(.medium.displayXl)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 40)
                
                //MARK: Horizontal 이미지
                let items = NewArrivalItem.getMockup()
                HPagingView(items: items) {
                    ForEach(items, id: \.self.id) { item in
                        Text(item.name)
                    }
                }
            }
        }
    }
}

#Preview {
    Discover()
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
