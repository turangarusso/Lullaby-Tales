//
//  Moon.swift
//  AlongStory
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds

struct Calderon: View {
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    
    @State private var isLoading = false
    @State private var stars: [Star] = []
    var phrases = [NSLocalizedString("Trova un luogo tranquillo e silenzioso per leggere.", comment: "") ,NSLocalizedString("Leggi con voce calma e rilassata.", comment: "") ,NSLocalizedString("Fai delle pause e lascia che il bambino assimili le informazioni.", comment: ""), NSLocalizedString("Usa toni di voce diversi per interpretare i personaggi.", comment: ""), NSLocalizedString("Parla con il bambino e chiedete cosa pensa della storia e dei personaggi.", comment: ""), NSLocalizedString("Leggi con regolarità per creare una routine confortevole per il bambino.", comment: "")]
    @State var currentPhrase = 0
    
    var body: some View {
        ZStack {
            Color.black
            Image("bg")
                .ignoresSafeArea()
            ForEach(stars, id: \.rotation) { star in
                Image("lilstar")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
                    .rotationEffect(.degrees(star.rotation))
                    .offset(x: star.position.x, y: star.position.y)
            }
            VStack {
                VStack(alignment:.center){
                    Text(phrases[currentPhrase])
                        .font(.largeTitle)
                        .padding(.top, 200)
                        .padding(.horizontal)
                        .frame(width: 400, height: 400)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .animation(.easeInOut(duration: 1.5))
                        .onAppear() {
                            Timer.scheduledTimer(withTimeInterval: 9, repeats: true) { timer in
                                withAnimation {
                                    currentPhrase = (currentPhrase + 1) % phrases.count
                                }
                            }
                        }// EndOnAppear
                }                        .padding()
                ZStack {
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.yellow)
                        .frame(width: 80, height: 80)
                        .padding(.bottom, 60)
                        .offset(x: isLoading ? 50 : -70, y: 0)
                        .animation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true), value: isLoading)
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .offset(x: isLoading ? -70 : 50, y: 0)
                        .animation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true), value: isLoading)
                }
                Text("Caricamento...")
                    .font(.headline)
                    .foregroundColor(.white)

                HStack {
                    Spacer()
                    GADBannerViewController()
                        .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                    Spacer()
                }                    .padding(.bottom, 200)
                                     .padding(.top, 180)

            }
        }// End ZStack
        .onAppear {
            withAnimation {
                isLoading = true
            }
            
            generateStars()
            startStarsAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                withAnimation {
                    isLoading = false
                }
            }
        }
    }// End body
    
    func generateStars() {
        for i in 1...6 {
            let x = Double.random(in: -500...500)
            let y = Double.random(in: -500...500)
            let rotation = Double.random(in: 0...360)
            let star = Star(position: CGPoint(x: x, y: y), rotation: rotation)
            stars.append(star)
        }
    }
    
    func startStarsAnimation() {
        for index in 0..<stars.count {
            //let delay = Double.random(in: 2...20)//unused
            //let speed = Double.random(in: 2.0...5.0)
            let distance = Double.random(in: 0...0)//0...150
            let angle = Double.random(in: 0...180)
            let radians = angle * .pi / 180
            let x = distance * cos(radians)
            let y = distance * sin(radians)
            let position = CGPoint(x: x, y: -y)
            
            withAnimation(Animation.linear(duration: 10.0).delay(0.0).repeatForever(autoreverses: true)) {
                stars[index].position = position
            }
        }
    }
}//End View


struct Star {
    var position: CGPoint
    var rotation: Double
}


struct Calderon_Previews: PreviewProvider {
    static var previews: some View {
        Calderon()
    }
}
