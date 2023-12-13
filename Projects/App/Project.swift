//
//  project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김지수 on 2023/12/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "App",
    targets: [
        .make(name: "App",
              product: .app,
              bundleId: "com.jisukim.app",
              infoPlist: .file(path: .relativeToRoot("Projects/App/Info.plist")),
              sources: ["Sources/**"],
              resources: ["Resources/**"],
              dependencies: [
                .project(target: "Core",
                         path: .relativeToRoot("Projects/Core")),
                .project(target: "DesignSystem",
                         path: .relativeToRoot("Projects/DesignSystem"))
              ]
             )
    ],
    resourceSynthesizers: [
      .custom(name: "Assets", parser: .assets, extensions: ["xcassets"]),
      .fonts()
    ],
    additionalFiles: [
      "./xcconfigs/NikeDesignSystemExample.shared.xcconfig"
    ]
)
