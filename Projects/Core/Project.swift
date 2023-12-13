//
//  project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김지수 on 2023/12/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "Core",
    targets: [
        .make(name: "Core",
              product: .framework,
              bundleId: "com.jisukim.core",
              sources: ["Sources/**"],
              dependencies: []
             )
    ]
)
