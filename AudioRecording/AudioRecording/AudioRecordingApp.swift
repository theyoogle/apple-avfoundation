//
//  AudioRecordingApp.swift
//  AudioRecording
//
//  Created by The YooGle on 29/06/22.
//

import SwiftUI
import AVFoundation

@main
struct AudioRecordingApp: App {
    
    init() {
        print("Application is starting up. App initialiser.")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let err {
            print("AVAudioSession configuration error: \(err.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
