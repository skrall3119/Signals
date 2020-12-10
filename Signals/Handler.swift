//
//  Handler.swift
//  Signals
//
//  Created by Alex Janci on 10/25/20.
//  Copyright © 2020 Alex Janci. All rights reserved.
//
import UIKit
import Foundation

let letters = ["A", "B", "C", "D", "E", "F", "G"]
let notes = ["A", "x", "B", "C", "x", "D", "x", "E", "F", "x", "G", "x"]
let formula = ["W", "W", "H", "W", "W", "W", "H"]



func find(a: [String], target: String) -> Int {
    for i in 0..<a.count{
        if a[i] == target {
            return i;
        }
    }

    return -1;
}

func shift(array: [String], position: Int) -> [String]{
    var newArray = array
    for _ in 0 ..< position {
        let temp = newArray[0]
        for j in 0 ..< newArray.count - 1{
            newArray[j] = newArray[j + 1]
        }
        newArray[6] = temp
    }
    return newArray;
}

func addSharpFlat(distance: Int) -> String{
    var accidentals = ""
    
    for _ in 0..<abs(distance){
        if distance > 0{
            accidentals += "#"
        } else if distance < 0 {
            accidentals += "♭"
        }
    }
    return accidentals
}

func sharpFlat(accent: String) -> Int{
    var offset = 0
    for letter in accent {
        if letter == "#" {
            offset += 1
        } else if letter == "♭"{
            offset -= 1
        }
    }
    return offset;
}

func findNextLetter(letters: [String], letter: String) -> String{
    var nextLetter: String
    let nextLetterPos = (find(a: letters, target: letter) + 1) % letters.count
    nextLetter = letters[nextLetterPos]
    return nextLetter
}
    
func calcDistance(i1: Int, i2: Int) -> Int{
    var i = (i1 - i2) % 12
    if (i > 6){
        i -= 12
    }
    else if (i < -6){
        i += 12
    }
    return i
}

func updateNotes(scale: [String], textViews: [UILabel]){
    for i in 0..<textViews.count{
        textViews[i].text = scale[i]
        
        let width = textViews[i].frame.size.width
        let newSize = textViews[i].sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        textViews[i].frame.size = CGSize(width: max(newSize.width, width), height: newSize.height)
    }
}

func updateChords(scale: [String], suffix: [String], textViews: [UILabel]){
    for i in 0..<textViews.count{
        textViews[i].text = scale[i] + suffix[i]
        
        let width = textViews[i].frame.size.width
        let newSize = textViews[i].sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        textViews[i].frame.size = CGSize(width: max(newSize.width, width), height: newSize.height)
        
    }
}

func buildScale(note: String, formula: [String]) -> [String]{
    var scale = [String]()
    scale.append(note)
    
    let offset = sharpFlat(accent: note)
    var currentPos: Int = find(a: notes, target: String(note.prefix(1))) + offset
    
    var nextLetterPos: Int
    var distance: Int
    
    var nextLetter: String
    
    for i in 1...7{
        if formula[Int(i)-1] == "W"{
            currentPos = (currentPos + 2) % 12
            nextLetter = findNextLetter(letters: letters, letter: String(scale[i - 1].prefix(1)))
            nextLetterPos = find(a: notes, target: nextLetter)
            distance = calcDistance(i1: currentPos, i2: nextLetterPos)
            nextLetter += addSharpFlat(distance: distance)
            scale.append(nextLetter)
        } else {
            currentPos = (currentPos + 1) % 12
            nextLetter = findNextLetter(letters: letters, letter: String(scale[i - 1].prefix(1)))
            nextLetterPos = find(a: notes, target: nextLetter)
            distance = calcDistance(i1: currentPos, i2: nextLetterPos)
            nextLetter += addSharpFlat(distance: distance)
            scale.append(nextLetter)
        }
        if (scale[i] == ("x")) {
            nextLetter = findNextLetter(letters: letters, letter: String(scale[i - 1].prefix(1)))
            nextLetterPos = find(a: notes, target: nextLetter)
            distance = calcDistance(i1: currentPos, i2: nextLetterPos)
            nextLetter += addSharpFlat(distance: distance)
            scale.append(nextLetter)
        }
        
    }
    return scale
    
}

func makeDominants(scale: [String]) -> [String]{
    var dominants: [String] = []
    
    for i in scale {
        let test = notes[(find(a: notes, target: i) + 7) % 12]
        print(test)
        dominants.append(test)
    }
    
    return dominants
}
