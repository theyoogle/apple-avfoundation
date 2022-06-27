//
//  CustomSlider.swift
//  UIControls
//
//  Created by The YooGle on 27/06/22.
//

import SwiftUI

struct CustomSlider: View {

    @Binding var percentage: Float // or some value binded

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.black)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ dragValue in
                    self.percentage = min(max(0, Float(dragValue.location.x / geometry.size.width * 100)), 100)
                }))
        }
    }
}
