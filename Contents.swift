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
