import UIKit

// Swift 5.0 updates

// TODO: create a repo that highlights Swift 5.0 updates
// Prerequisite is Xcode 10.2 +
// Xcode 11 will be shipped with Swift 5.1


//=======================================
// Raw Strings
//=======================================
// Extended String Delimiters - https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html

// "hello"
print("\"hello\"")

let message = #""hello""#

let programmingLanguage = "iOS"
let pursuitMessage = #""Welcome to Pursuit's \#(programmingLanguage) 6.0 cohort""#
    // We dont have to put backslashes for the ' as well as the front and back
    // Handling string interpolation by adding an extra # delimeter embedding in \#()
print(pursuitMessage)


//======================================
// Character Properties
//======================================
// Inspecting a Character - https://developer.apple.com/documentation/swift/character

let sentence = "1$🧨&4?ap*"
for char in sentence {
    if char.isLetter {
        print("letter: \(char)")
    }
    if char.isCurrencySymbol {
        print("currency symbol: \(char)")
    }
    if char.isSymbol {
        print("symbol: \(char)")
    }
    if char.isPunctuation {
        print("puncuation: \(char)")
    }
}

//==========================================================================
// Review map, filter, flatmap
//==========================================================================
let tweets = [ "starting the fall cycle at #pursuit",
               "#darnclosures are killing me",
               "dreams of an #ios #developer",
               "#swiftui is dope, #iosdeveloper #mindblown"
]

// use map, filter and flatmap to return an array of hashtags
// output: ["#pursuit", "#darnclosures", "#ios", "#developer", "#swiftui", "#iosdeveloper", "#mindblown"]

// Hint: start out by writing a function to return an array of hashtags from a given String

func getHashtags(input: String) -> [String] {
    let newArray = input.components(separatedBy: " ")
    return newArray.filter{$0.starts(with: "#")}
}

let tags = tweets.map{getHashtags(input: $0)}.flatMap{$0}
print(tags)



//==========================================================================
// Review compactMap
//==========================================================================
// use compactMap to return only valid numbers from numStrings
// output: [1, 9, 54]
let numStrings = ["1","a","&","9", "54", "🎉"]

var validNumber = numStrings.compactMap{Int($0)}
print(validNumber)



//==========================================================================
// Review mapValues
//==========================================================================
// given dictionaryOfNums square each value
// output: [2: 4, 3: 9, 4: 16, 5: 25]
let dictionaryOfNums = [2: 2, 3: 3, 4: 4, 5: 5]

var doubles = dictionaryOfNums.mapValues{$0 * $0}

print(doubles)


//========================================
//Dictionaries with compactmap
//========================================

/* Warmup Question: using compactMapValues
 (1) In the grades dictionary below find and print the valid names, integer grade pairings, a letter grade is NOT valid (reminder compactMapValues performs a transformation and only returns non-nil key,value pairings)
 (2) Calculate the average of the valid grades
 
 Output:
 Valid grades: ["William": 94, "Cathy": 80, "Bernie": 65, "George": 75, "Asher": 59, "Arthur": 77]
 Average of valid grades: 75
 */

let grades = ["Cathy": "80",
              "Bertie": "A",
              "George": "75",
              "Esther": "C",
              "William": "94",
              "Asher": "59",
              "Vincent": "B",
              "Arthur": "77",
              "Bernie": "65",
              "James": "B"
]
//(1)
let validGrades = grades.compactMapValues{ Int($0) }
print(validGrades)
    //["Bernie": 65, "William": 94, "Arthur": 77, "George": 75, "Asher": 59, "Cathy": 80]

//(2)
let gradeValues = validGrades.values
let averageGrades = gradeValues.reduce(0, +) / gradeValues.count
print(averageGrades) //75

//======================================
//String Interpolation Protocol in Swift 5
//======================================

let name = "Matt"
print("Good morning, \(name)")

struct User {
    let name: String
    let age: Int
    let dateAdded: Date
}

let jian = User(name: "Jian", age: 21, dateAdded: Date())
print("User details: \(jian)")

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: User) {
        appendInterpolation("\(value.name) is \(value.age) old, added on \(value.dateAdded)")
    }
    mutating func appendInterpolation(_ value: User, dateFormattingStyle: DateFormatter.Style) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateFormattingStyle
        let dateString = dateFormatter.string(from: value.dateAdded)
        appendInterpolation("\(value.name) was added on \(dateString)")
    }
}

print("User details using custom interpolation: \(jian)")
print("User details update: \(jian, dateFormattingStyle: .long)")
