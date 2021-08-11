---
date: 2021-02-28 19:29
description: SwiftUI HexColor
tags: SwiftUI
---

### SwiftUI HexColor
SwiftUI에서 Hex 코드로 Color를 지정해야 할 때가 있다. (ex: fbfbfb, bbbbbb)<br>

SwiftUI 자체적으로는 Hex 코드로 Color를 지정할 수 없기 때문에 extension을 통해 따로 포팅 해줘야한다.

아래는 Color.init(hex: String) 코드이다.

### HexColor.swift
```Swift
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
```
