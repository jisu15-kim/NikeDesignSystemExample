//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Jisu Kim on 2023/12/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.make(
    name: "Scenes",
    targets: [
        .make(name: "Main",
              product: .framework,
              bundleId: "com.jisukim.main.main",
              sources: ["Main/Sources/**"],
              dependencies: [
                .project(target: "Core", path: .relativeToRoot("Projects/Core")),
                .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
              ]
             )
    ]
)
