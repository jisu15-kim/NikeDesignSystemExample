import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// MARK: - Project

let workspace = Workspace(
    name: "NikeDesignSystemExample",
    projects: [
        "Projects/App",
        "Projects/Core",
        "Projects/DesignSystem"
    ],
    schemes: [
        Scheme(
          name: "NikeDesignSystemExample",
          buildAction: .buildAction(
            targets: [.project(path: "Projects/App", target: "App")]),
          runAction: .runAction(configuration: .debug),
          archiveAction: .archiveAction(configuration: .debug),
          profileAction: .profileAction(configuration: .debug),
          analyzeAction: .analyzeAction(configuration: .debug)
        ),
    ]
)

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
