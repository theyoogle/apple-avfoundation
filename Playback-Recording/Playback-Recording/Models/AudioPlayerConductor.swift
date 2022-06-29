//
//  AudioPlayerConductor.swift
//  Playback-Recording
//
//  Created by The YooGle on 27/06/22.
//

import AVFoundation

class AudioPlayerConductor: ObservableObject {
    
    @Published var playing = false
    
    var playbackRate: Float = 1.0 {
        didSet {
            setPlaybackRate(playbackRate)
        }
    }
    
    var players: [AVAudioPlayer]!
    var playerImages = ["guitar", "bass", "drums"]
    
    init() {
        
        let guitarPlayer = playerForFile("guitar")
        let bassPlayer = playerForFile("bass")
        let drumsPlayer = playerForFile("drums")
        
        players = [guitarPlayer, bassPlayer, drumsPlayer]
        
        setupNotifications()
    }
    
    func setupNotifications() {
        
        let nc = NotificationCenter.default
        
        // Handle interruption notification
        nc.addObserver(self,
                       selector: #selector(handleInterruption),
                       name: AVAudioSession.interruptionNotification,
                       object: AVAudioSession.sharedInstance())
        
        // Handle route change
        nc.addObserver(self,
                       selector: #selector(handleRouteChange),
                       name: AVAudioSession.routeChangeNotification,
                       object: AVAudioSession.sharedInstance())
    }
    
    func playerForFile(_ name: String) -> AVAudioPlayer {
        let url = Bundle.main.url(forResource: name, withExtension: "caf")!
        do {
            
            let player = try AVAudioPlayer(contentsOf: url)
            
            // enable controlling playback rate
            player.enableRate = true
            // Infinite Loop
            player.numberOfLoops = -1
            // preparing the player upon creation minimizes the latency between
            // calling the play method and hearing audio output
            player.prepareToPlay()
            
            return player
            
        } catch let err {
            print("Error creating player: \(err.localizedDescription)")
            fatalError()
        }
    }
    
    func play() {
        if !playing {
            // to start plaback from beginning
            let delayTime = players.first!.deviceCurrentTime + 0.01
            
            for player in players {
                player.play(atTime: delayTime)
            }
            playing = true
        }
    }
    
    func stop() {
        if playing {
            for player in players {
                player.stop()
                
                // moves the playhead to start
                player.currentTime = 0.0
            }
            playing = false
        }
    }
    
    func setPlaybackRate(_ rate: Float) {
        for player in players {
            player.rate = rate
        }
    }
    
    func isValidIndex(_ i: Int) -> Bool {
        return i >= 0 && i < players.count
    }
    
    func setVolume(_ volume: Float, playerIndex i: Int) {
        if isValidIndex(i) {
            players[i].volume = volume
        }
    }
    
    func setPan(_ pan: Float, playerIndex i: Int) {
        if isValidIndex(i) {
            players[i].pan = pan
        }
    }
    
    @objc func handleInterruption(notification: Notification) {

        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue)
        else {
            return
        }
        
        switch type {
            case .began:
                print("Interruption Began")
                stop()
                
            case .ended:
                print("Interruption Ended")
                guard let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt else {
                    return
                }
                
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    play()
                } else {
                    // Else part
                }
        }
    }
    
    @objc func handleRouteChange(notification: Notification) {

        guard let userInfo = notification.userInfo,
              let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
              let reason = AVAudioSession.RouteChangeReason(rawValue: reasonValue)
        else {
            return
        }
        
        switch reason {
            case .newDeviceAvailable: // New device found.
                let session = AVAudioSession.sharedInstance()
                let headphonesConnected = hasHeadphones(in: session.currentRoute)
                print("New device connected: headphone -> \(headphonesConnected)")
            
            case .oldDeviceUnavailable: // Old device removed.
                if let previousRoute = userInfo[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription {
                    let wasHeadphones = hasHeadphones(in: previousRoute)
                    print("Old device disconnected: was headphone -> \(wasHeadphones)")
                    if wasHeadphones {
                        stop()
                    }
                }
            
            default: ()
        }
    }
    
    func hasHeadphones(in routeDescription: AVAudioSessionRouteDescription) -> Bool {
        // Filter the outputs to only those with a port type of headphones.
        return !routeDescription.outputs.filter({$0.portType == .headphones}).isEmpty
    }
    
}
