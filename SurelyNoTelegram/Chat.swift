//
//  Chat.swift
//  SurelyNoTelegram
//
//  Created by Giovanni Bifulco on 25/03/24.
//


import Foundation

struct Chat: Identifiable {
    var id = UUID()
    var name: String
    var lastMessage: String
    var profileImageName: String 
    
}
