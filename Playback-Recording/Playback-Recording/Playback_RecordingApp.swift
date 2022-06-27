//
//  Playback_RecordingApp.swift
//  Playback-Recording
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI
import AVFoundation

@main
struct Playback_RecordingApp: App {

    init() {
        print("Application is starting up. App initialiser.")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let err {
            print("AVAudioSession configuration error: \(err.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            PlayerView()
        }
    }
}
