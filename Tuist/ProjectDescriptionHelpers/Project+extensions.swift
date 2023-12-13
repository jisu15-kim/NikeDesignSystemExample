//
//  Project+extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by 김지수 on 2023/12/14.
//

import ProjectDescription

extension Project {
  public static func make(
    name: String,
    targets: [Target],
    packages: [Package] = [],
    resourceSynthesizers: [ResourceSynthesizer] = [],
    additionalFiles: [FileElement] = []
  ) -> Project {
    return Project(
      name: name,
      organizationName: "com.jisukim",
      options: .options(
        automaticSchemesOptions: .disabled,
        textSettings: .textSettings(usesTabs: false, indentWidth: 4, tabWidth: 4)
      ),
      packages: packages,
      targets: targets,
      additionalFiles: additionalFiles,
      resourceSynthesizers: resourceSynthesizers
    )
  }
}
