//
//  Message.swift
//  SurelyNoTelegram
//
//  Created by Giovanni Bifulco on 25/03/24.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String = UUID().uuidString
    var text: String
    var isCurrentUser: Bool
    

}
