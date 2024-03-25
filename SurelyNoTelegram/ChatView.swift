//
//  ChatView.swift
//  SurelyNoTelegram
//
//  Created by Giovanni Bifulco on 25/03/24.
//

import SwiftUI

struct ChatView: View {
    var chat: Chat
    @State private var messageText: String = ""
    @State private var messages: [Message] = [] 
    init(chat: Chat) {
        self.chat = chat
     
        if let savedMessages = UserDefaults.standard.data(forKey: "SavedMessages"),
           let decodedMessages = try? JSONDecoder().decode([Message].self, from: savedMessages) {
            self._messages = State(initialValue: decodedMessages)
        }
    }

    var body: some View {
        VStack {
          
            ScrollView {
                ScrollViewReader { scrollView in
                    ForEach(messages) { message in
                        HStack {
                            if message.isCurrentUser {
                                Spacer()
                            }
                            Text(message.text)
                                .padding()
                                .background(message.isCurrentUser ? Color.blue : Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            if !message.isCurrentUser {
                                Spacer()
                            }
                        }
                        .padding(message.isCurrentUser ? .leading : .trailing, 45)
                        .padding(.vertical, 5)
                        .transition(.slide)
                        .id(message.id)
                    }
                }
            }
            .padding(.top, 10)
            
      
            
            HStack {
                TextField("Scrivi un messaggio...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))
                
                Button(action: sendMessage) {
                    Text("Invia")
                        .bold()
                }
            }
            .padding()
        }
        .navigationTitle(chat.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
   
    func sendMessage() {
        guard !messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let newMessage = Message(text: messageText, isCurrentUser: true)
        messages.append(newMessage)
        messageText = ""


        if let encoded = try? JSONEncoder().encode(messages) {
            UserDefaults.standard.set(encoded, forKey: "SavedMessages")
        }
    }
}
