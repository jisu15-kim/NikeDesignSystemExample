//
//  project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김지수 on 2023/12/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "DesignSystem",
    targets: [
        .make(name: "DesignSystem",
              product: .framework,
              bundleId: "com.jisukim.designSystem",
              sources: ["Sources/**"],
              resources: ["Resources/**"],
              dependencies: []
             )
    ],
    resourceSynthesizers: [
      .custom(name: "Assets", parser: .assets, extensions: ["xcassets"]),
      .fonts()
    ]
)
