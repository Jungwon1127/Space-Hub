//
//  Color.swift
//  Space Hub
//
//  Created by Jungwon Kim on 11/4/21.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
    let backgroundTextColor = Color("BackgroundTextColor")
}
