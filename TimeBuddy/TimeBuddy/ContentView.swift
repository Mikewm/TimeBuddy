//
//  ContentView.swift
//  TimeBuddy
//
//  Created by Michael Murphy on 4/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var timeZones = [String]()
    @State private var newTimeZone = "GMT"
    @State private var selectedTimeZones = Set<String>()
    
    func deleteItems() {
        withAnimation {
            timeZones.removeAll(where: selectedTimeZones.contains)
        }
        save()
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        timeZones.move(fromOffsets: source, toOffset: destination)
        save()
    }
    
    func load() {
        timeZones = UserDefaults.standard.stringArray(forKey: "TimeZones") ?? []
        
    }
    func save() {
        UserDefaults.standard.set(timeZones, forKey: "TimeZones")
    }
    var body: some View {
        VStack {
            if timeZones.isEmpty {
                Text("Please add your first time zone below.")
                    .frame(maxHeight: .infinity)
            } else {
                List {
                    ForEach(timeZones, id: \.self) {
                        timeZone in
                        Text(timeZone)
                    }.onMove(perform: moveItems)
                    
                }
            }
            
        }
        .onAppear(perform: load)
        .padding()
        HStack {
            Picker("Add Time Zone", selection: $newTimeZone) {
                ForEach(TimeZone.knownTimeZoneIdentifiers, id: \.self) { timeZone in
                    Text(timeZone)
                }
            }
     
            Button("Add") {
                if timeZones.contains(newTimeZone) == false {
                    withAnimation {
                        timeZones.append(newTimeZone)
                    }
                    save()
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

