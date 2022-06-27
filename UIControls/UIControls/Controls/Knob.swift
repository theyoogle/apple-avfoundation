//
//  Knob.swift
//  UIControls
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct Knob: View {
    
    @State var value : Double = 0.0
    @State private var startDragValue : Double = -1.0
    
    var body: some View {
        Text("Knob \(value, specifier: "%.1f")")
            .gesture(DragGesture(minimumDistance: 0)
                .onEnded({ _ in
                    startDragValue = -1.0
                })
                .onChanged { dragValue in
                    let diff = dragValue.startLocation.y - dragValue.location.y
                    if startDragValue == -1 {
                        startDragValue = value
                    }
                    let newValue = startDragValue + Double(diff)
                    value = newValue < 0 ? 0 : newValue > 100 ? 100 : newValue
                })
    }
}
