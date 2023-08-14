//
//  SharePDFView.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI

struct ShareStoryView: View {
    var text: String
    var title: String
    var body: some View {
        ScrollView(.vertical){
            Text(title)
                .font(.system(size: 48))
                .bold()
                .padding(.horizontal, 24)
                .foregroundColor(.black).padding(.top, 96)
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
                .padding(24)
                .font(.system(size: 16))
        }
        .background(Color.white)
    }
}

struct SharePDFView_Previews: PreviewProvider {
    static var previews: some View {
        ShareStoryView(text: "", title: "")
    }
}
