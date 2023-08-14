//
//  UserInput.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import Foundation
import OpenAISwift

class UserData: ObservableObject {
    @Published var hero = ""
    @Published var antihero = ""
    @Published var theme = ""
}


/*
func generatePrompt(protagonista: String, antagonista: String, tema: String) -> String {
    let completePrompt = "Hero: [\(protagonista)] , Anti-Hero: [\(antagonista)], Theme: [\(tema)]. Write a short story of approximately 650 words that incorporates the hero, anti-hero, moral, and theme provided above. The story should have a titile, clear beginning, middle, and end, and should include a conflict that is ultimately resolved in a way that reinforces the chosen moral."
    return completePrompt
}
*/

func generatePrompt(protagonista: String, antagonista: String, tema: String) -> String {
    var promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT", comment: "")
    let preferredLanguage = Locale.preferredLanguages[0]

    if preferredLanguage.contains("it") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_IT", comment: "")
    } else if preferredLanguage.contains("es") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_ES", comment: "")
    }
    else if preferredLanguage.contains("pt") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_PT", comment: "")
    }
    else if preferredLanguage.contains("fr") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_FR", comment: "")
    }

    return String(format: promptFormat, protagonista, antagonista, tema)
}

func takePrompt(protagonista: String, antagonista: String, tema: String) -> String {
    var promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT", comment: "")
    let preferredLanguage = Locale.preferredLanguages[0]

    if preferredLanguage.contains("it") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_IT", comment: "")
    } else if preferredLanguage.contains("es") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_ES", comment: "")
    }
    else if preferredLanguage.contains("pt") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_PT", comment: "")
    }
    else if preferredLanguage.contains("fr") {
        promptFormat = NSLocalizedString("HERO_PROMPT_FORMAT_FR", comment: "")
    }

    return String(format: promptFormat, protagonista, antagonista, tema)
    
}


func takeSystem() -> String{
    var systemPrompt = NSLocalizedString("HERO_SYSTEM_FORMAT", comment: "")
    let preferredLanguage = Locale.preferredLanguages[0]
    
    if preferredLanguage.contains("it") {
        systemPrompt = NSLocalizedString("HERO_SYSTEM_FORMAT_IT", comment: "")
    } else if preferredLanguage.contains("es") {
        systemPrompt = NSLocalizedString("HERO_SYSTEM_FORMAT_ES", comment: "")
    }
    else if preferredLanguage.contains("pt") {
        systemPrompt = NSLocalizedString("HERO_SYSTEM_FORMAT_PT", comment: "")
    }
    else if preferredLanguage.contains("fr") {
        systemPrompt = NSLocalizedString("HERO_SYSTEM_FORMAT_FR", comment: "")
    }
    
    return String(format: systemPrompt)
}

///This function return
func generateTurboPrompt(protagonista: String, antagonista: String, tema: String) -> [ChatMessage] {
    let completePrompt : [ChatMessage] = [
        
        ChatMessage(role: .system, content: takeSystem()),
        
        
        ChatMessage(role: .user, content: takePrompt(protagonista: protagonista, antagonista: antagonista, tema: tema))
        
        
        ]
    return completePrompt
}
