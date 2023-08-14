//
//  ArchiveView.swift
//  OpenAI
//
//  Created by Ac Analytics.
//

import SwiftUI

struct ArchiveView: View {
    
    //Fetch from coreData
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Story.entity(), sortDescriptors: [])
    var stories: FetchedResults<Story>
    //Get Screen dimension
    let screenRect = UIScreen.main.bounds
    
    var body: some View {
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        GeometryReader { geometry in
            ZStack {
                Image("bg").frame(width: screenWidth, height: screenHeight)
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Library")
                                .font(.system(size: 72))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 112)
                            Text("Check old stories")
                                .font(.system(size: 28))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 24)
                        }.padding(.horizontal, 24)
                        Spacer()
                    }
                    List {
                        ForEach(stories) { story in
                            NavigationLink(destination: StoryView(text: story.savedStory ?? "", title: story.storyTitle ?? "Titolo non trovato"))
                            {
                                Text(story.storyTitle ?? "Titolo non presente")
                                    .padding()
                            }
                        }
                        .onDelete(perform: deleteProducts)
                    }
                    .cornerRadius(25)
                    .padding(24)
                    
                }
            }.ignoresSafeArea()
        }
    }
    
    
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { stories[$0] }.forEach(viewContext.delete)
            saveContext()
        }
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



struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}
