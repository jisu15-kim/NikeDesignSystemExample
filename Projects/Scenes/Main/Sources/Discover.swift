//
//  Discover.swift
//  Main
//
//  Created by Jisu Kim on 2023/12/23.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI

enum DiscoverImage {
    static let headerImage = "https://s3-alpha-sig.figma.com/img/bb35/1e19/e79d34332ea94a41ed8cd1c4f14fcd64?Expires=1704067200&Signature=QyY1w1NVtGFZ8Yl1FwYnZTTwYphZNzmwW~mA8vYQyOxbKjfIlDgFdRG3YJINxhErQvSRwY4vD02WFOMbpakom1ebnJmKlS3RCsydl6mUhY9ACQALtp-Wnk6GWKF1sgzyqJbwsLVLZ7Roqzl6VXfr34cEbMdpElu7D4Eh2ypRxqkVb9SFbpQJ1kwfhPySfhzdNOtOpczYKk7kv4caNZgzw91dPXR-qK~~kDnb3OFwQd-UQSupIrz~oMM0oqLJ-9KPovN-kcR5GVh-jWxor6QN3PKfko3BO-NZSyEMm8lNg~pMv6ft8CDjtZPzHGnpyc9G8a3YJ6jy19cD9DoWekDhqg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    
}

struct Discover: View {
    var body: some View {
        ScrollView {
            VStack {
                //MARK: 헤더 부분
                HStack {
                    VStack {
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
            }
        }
    }
}

#Preview {
    Discover()
}
