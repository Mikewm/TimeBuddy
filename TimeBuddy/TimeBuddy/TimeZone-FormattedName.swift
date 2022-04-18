//
//  TimeZone-FormattedName.swift
//  TimeBuddy
//
//  Created by Michael Murphy on 4/16/22.
//

import Foundation

extension TimeZone {
    var formattedName: String {
        let start = localizedName(for: .generic, locale: .current) ?? "Unknown"
        return "\(start) - \(identifier)"
    }
}
