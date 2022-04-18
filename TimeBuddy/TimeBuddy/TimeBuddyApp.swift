//
//  TimeBuddyApp.swift
//  TimeBuddy
//
//  Created by Michael Murphy on 4/16/22.
//

import SwiftUI

@main
struct TimeBuddyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    var body: some Scene {
        Settings { }
    }
}
