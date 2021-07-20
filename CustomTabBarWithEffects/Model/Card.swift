//
//  Card.swift
//  CustomTabBarWithEffects
//
//  Created by Alexander Bonney on 7/19/21.
//

import SwiftUI


// Card model and sample card data

struct Card: Identifiable, Equatable {
    var id = UUID().uuidString
    var title: String
    var image: String
    var cardColor: String
}

var cards: [Card] = [
Card(title: "University of Cambridge", image: "card1", cardColor: "C1"),
Card(title: "Boston College Eagles", image: "card2", cardColor: "C2")
]


struct Faculty: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

var faculties: [Faculty] = [
    Faculty(name: "Computer Science", image: "desktopcomputer"),
    Faculty(name: "Judge Business School", image: "graduationcap.fill"),
    Faculty(name: "English", image: "a.magnify"),
    Faculty(name: "Engineering", image: "wrench.and.screwdriver.fill"),
    Faculty(name: "Physics", image: "applescript.fill"),
    Faculty(name: "Geography", image: "globe"),
    Faculty(name: "Medicine", image: "heart.text.square"),
    Faculty(name: "Education", image: "pencil.and.outline"),
    Faculty(name: "Classics", image: "book.closed.fill"),
    Faculty(name: "Architecture", image: "level"),
    Faculty(name: "Economics", image: "banknote"),
    Faculty(name: "History of Art", image: "stop"),
    Faculty(name: "Law", image: "text.book.closed"),
    Faculty(name: "Technology", image: "esim.fill")
]
