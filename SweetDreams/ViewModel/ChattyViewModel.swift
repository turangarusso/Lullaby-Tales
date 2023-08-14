//
//  ChattyViewModel.swift
//  OpenAI
//
//  Created by Ac Analytics.
//

import OpenAISwift
import SwiftUI

final class ChattyViewModel: ObservableObject {
    
    init(){
        
    }
    
    private var client: OpenAISwift?
    
    func initialize(){
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, model: OpenAIModelType = .gpt3(.davinci), temperature: Double = 0.7, completion: @escaping (String) -> Void ) {
        client?.sendCompletion(with: text, maxTokens: 1000, completionHandler: { result in
            switch result {
            case .success(let success):
                let output = success.choices.first?.text ?? ""
                completion(output)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        })
    }
    
    func Turbosend(chat: [ChatMessage], completion: @escaping (String) -> Void) {
        client?.sendChat(with: chat, maxTokens: 1000, completionHandler: { result in
            switch result {
                case .success(let success):
                let output = success.choices.first?.message.content ?? "Nothing"
                    completion(output)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
        })
    }
    
    
}
