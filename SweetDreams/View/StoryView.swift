//
//  StringView.swift
//  OpenAI
//
//  Created by Ac Analytics.
//

import SwiftUI

struct StoryView: View {
    
    var text: String
    var title: String
    let screenRect = UIScreen.main.bounds
    var body: some View {
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        ZStack{
            Image("textbg")
                .frame(width: screenWidth, height: screenHeight)
                .ignoresSafeArea()
                .scaledToFit()
            ScrollView(.vertical){
                Text(title)
                    .font(.system(size: 48))
                    .bold()
                    .padding(.horizontal, 24)
                    .foregroundColor(.white)
                    .padding(.top, 96)
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(24)
                    .font(.system(size: 16))
                Button {
                    
                    sharePDF(content: { ShareStoryView(text: text, title: title) }, fileName: title)
                } label: {
                    Text("Share")
                }
                .buttonStyle(BigButtonStyle())
            }.padding(.bottom, 48)
                .preferredColorScheme(.dark)
        }
    }
}


struct StringView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(text: "Once upon a time, in a world just like ours, there lived a boy named Mortimer. He was a curious and adventurous boy who loved to explore and discover new things.One day, while playing in his backyard, Mortimer stumbled upon a strange portal. Without hesitation, he stepped through it and found himself in a parallel universe that was almost identical to his own, but with one key difference - everything was dark and gloomy.As he explored this new world, Mortimer soon encountered Evil Mortimer, his doppelganger from the parallel universe. Evil Mortimer was just like Mortimer in every way, except for his cruel and selfish nature. Mortimer was terrified, but he knew he had to find a way back to his own world.With the help of a kind and wise old sage, Mortimer learned that the only way to defeat Evil Mortimer and return home was to embrace his own goodness and use it to outsmart his evil counterpart. Mortimer faced many challenges and obstacles, but he remained true to himself and ultimately triumphed over Evil Mortimer.As Mortimer stepped back through the portal and returned home, he realized the importance of being true to himself and always doing what is right, even when faced with difficult situations. He knew that his goodness and kindness were what made him unique, and he vowed to never forget that lesson.From that day forward, Mortimer continued to explore and discover new things, but he did so with a greater sense of purpose and a deeper understanding of the power of goodness and kindness.", title: "Mortimer and his evil double")
    }
}
