//
//  ProgressBarView.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI

struct ProgressBarView: View {
    let currentIndex: Int
    let numberOfScreens: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfScreens) { index in
                Rectangle()
                    .fill(index == currentIndex ? Color.white : Color.gray.opacity(0.5))
                    .frame(height: 5)
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(currentIndex: 1, numberOfScreens: 3)
    }
}
