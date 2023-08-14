//
//  GenerateView.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import OpenAISwift

struct GenerateView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Story.entity(), sortDescriptors: [])
    var stories: FetchedResults<Story>
    @ObservedObject var chattyViewModel = ChattyViewModel()
    @State private var currentIndex = 0
    @State var response = ""
    @State var storyTitle = ""
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            switch currentIndex {
                
            case 0:
                SummaryView(performAction: {
                    /*
                    send(hero: userData.hero, antiHero: userData.antihero, theme: userData.theme)
                    currentIndex = 1
                     */
                    Turbosend(hero: userData.hero, antiHero: userData.antihero, theme: userData.theme)
                    currentIndex = 1
                }).onShake {
                    /*
                    send(hero: userData.hero, antiHero: userData.antihero, theme: userData.theme)
                     */
                    Turbosend(hero: userData.hero, antiHero: userData.antihero, theme: userData.theme)
                    currentIndex = 1
                }
                
            case 1:
                Calderon()
                
            case 2:
                StoryView(text: String(response), title: storyTitle)
                
            default:
                EmptyView()
                
                
            }
        }.task {
            chattyViewModel.initialize()
            
        }
    }
    
    ///This function use text-davinci-003 model
    private func send(hero : String, antiHero : String, theme : String){
        chattyViewModel.send(text: generatePrompt(protagonista: hero, antagonista: antiHero, tema: theme)) { response in
            DispatchQueue.main.async {
                //Get the response
                self.response = response
                //Get the title
                self.storyTitle = GetTitle(response: response)
                //Store to coreData
                addArchive(storyToStore: response, titleToStore: self.storyTitle)
                self.currentIndex = 2
            }
        }
    }
    
    ///This function use GPT 3.5 Turbo. It use a different input parameter of type ChatMessage.
    private func Turbosend(hero: String, antiHero : String, theme : String){
        chattyViewModel.Turbosend(chat: generateTurboPrompt(protagonista: hero, antagonista: antiHero, tema: theme)) { response in
                DispatchQueue.main.async {
                    //Get the response
                    self.response = response
                    //Get the title
                    self.storyTitle = GetTitle(response: response)
                    //Store to coreData
                    addArchive(storyToStore: response, titleToStore: self.storyTitle)
                    self.currentIndex = 2
                }
            }
        }
    
    
    
    
    private func GetTitle(response : String) -> String{
        let lines = response.components(separatedBy: .newlines)
        var i = 1
        var title = lines[0]
        while title.isEmpty {
            title = lines[i]
            i += 1
        }
        return title
    }
    
    private func addArchive(storyToStore: String, titleToStore: String){
        let story = Story(context: viewContext)
        story.storyTitle = titleToStore
        story.savedStory = storyToStore
        saveContext()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}


struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView().environmentObject(UserData())
    }
}
