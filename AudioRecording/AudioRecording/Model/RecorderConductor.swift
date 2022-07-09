//
//  RecorderConductor.swift
//  AudioRecording
//
//  Created by The YooGle on 29/06/22.
//

import Foundation
import AVFoundation

class RecorderConductor {
    
    let recorder: AVAudioRecorder
    
    init() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = path.appendingPathComponent("memo.caf")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatAppleIMA4),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderBitDepthHintKey: 16,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            recorder = try AVAudioRecorder(url: url, settings: settings)
            recorder.prepareToRecord()
        } catch let err {
            print("Error creating recorder: \(err.localizedDescription)")
            fatalError()
        }
        
        
    }
    
}
