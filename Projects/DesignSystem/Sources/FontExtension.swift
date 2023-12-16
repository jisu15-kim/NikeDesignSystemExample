//
//  FontExtension.swift
//  DesignSystem
//
//  Created by Jisu Kim on 2023/12/16.
//  Copyright © 2023 com.jisukim. All rights reserved.
//

import SwiftUI
import UIKit

public extension Font {
  init(uiFont: UIFont) {
    self = Font(uiFont as CTFont)
  }
}
