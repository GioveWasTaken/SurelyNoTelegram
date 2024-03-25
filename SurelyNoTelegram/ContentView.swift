//
//  ContentView.swift
//  SurelyNoTelegram
//
//  Created by Giovanni Bifulco on 25/03/24.
//


import SwiftUI

struct ContentView: View {
    let chats = [
        Chat(name: "Alice", lastMessage: "Ciao, come va?", profileImageName: "person.crop.circle.fill"), 
        Chat(name: "Bob", lastMessage: "Hai visto l'ultimo episodio?", profileImageName: "person.crop.circle.fill"),
        Chat(name: "Charlie", lastMessage: "Buon compleanno! 🎉", profileImageName: "person.crop.circle.fill")
    ]

    var body: some View {
        NavigationView {
            List(chats) { chat in
                NavigationLink(destination: ChatView(chat: chat)) {
                    HStack {
                        Image(systemName: chat.profileImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.trailing, 8)

                        VStack(alignment: .leading) {
                            Text(chat.name).font(.headline)
                            Text(chat.lastMessage).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Chats")
        }
    }
}
