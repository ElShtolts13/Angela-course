//
//  StoryBrain.swift
//  Destini
//
//  Created by User on 07.11.2023.
//

import Foundation
struct StoryBrain {
    
    var storyNumber = 0
    
    let stories = [
        Story(title: "You see a fork in the road", choise1: "Take a left", choise2: "Take a right"),
        Story(title: "You see a tiger", choise1: "Shout for help", choise2: "Play dead"),
        Story(title: "You find a treasure chest", choise1: "Open it", choise2: "Check for traps")
    ]
    
    func chooseStory() -> String {
        return stories[storyNumber].title
        
    }
    func chooseChoise1() -> String {
        return stories[storyNumber].choise1
    }
    func chooseChoise2() -> String {
        return stories[storyNumber].choise2
        
    }
}
