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
        
        // Upper will not stop audio on silent switch
        
        // For background audio, add entry in info.plist
        // Required background modes > [0] > App plays audio or streams audio/video using AirPlay
    }
    
    var body: some Scene {
        WindowGroup {
            PlayerView()
        }
    }
}
