//
//  Double.swift
//  Space Hub
//
//  Created by Jungwon Kim on 1/6/22.
//

import Foundation

extension Double {
    func removeZerosFromEnd() -> String {
            let formatter = NumberFormatter()
            let number = NSNumber(value: self)
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
            return String(formatter.string(from: number) ?? "")
        }
}
