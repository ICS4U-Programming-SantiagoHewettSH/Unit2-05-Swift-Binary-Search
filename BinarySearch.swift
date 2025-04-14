//
// BinarySearch.swift
//
// Created by Santiago Hewett
// Created on 2025/03/28
// Version 1.0
// Copyright (c) 2025 Santiago Hewett. All rights reserved.
//
// This program generates 10 random numbers between 1 and 100.
// It asks the user for a number, then uses binary search
// to find and print the index of the number if it exists.
//

// Import foundation for random number and input functions
import Foundation

// Number of elements in the array
let MAX_ARRAY = 10

// User input as string
var userNumberString: String = ""

// User input as integer
var userNumber: Int = 0

// Index result from binary search
var index: Int = 0

// The array of random integers
var arrayRandomInts: [Int] = []

// Repeat loop until user enters 'q'
repeat {
    // Generate random array
    arrayRandomInts = populatingArray()

    // Sort the array (required for binary search)
    arrayRandomInts.sort()

    // Ask user for a number
    print("What number are you searching for in the list below? Enter 'q' to quit.")

    // Print the array in one line
    for index in 0 ..< MAX_ARRAY {
        print("\(arrayRandomInts[index]) ", terminator: "")
    }

    // Prompt for input
    print(" Number: ", terminator: "")

    // Read user input
    userNumberString = readLine()!

    // If user wants to quit
    if userNumberString.lowercased() == "q" {
        print("Goodbye!")
    } else {
        // Try converting input to an integer
        guard let userNumber = Int(userNumberString) else {
            print("Invalid input \(userNumberString). Please enter a integer.")
            continue // Skip to next iteration
        }

        // Set up binary search range
        var low = 0
        var high = MAX_ARRAY - 1

        // Binary search loop
        while low <= high {
            let mid = (low + high) / 2

            if arrayRandomInts[mid] == userNumber {
                index = mid
                break
            } else if arrayRandomInts[mid] < userNumber {
                low = mid + 1 // Search right half
            } else {
                high = mid - 1 // Search left half
            }

            index = -1 // Not found yet
        }

        // Show result
        if index != -1 {
            print("The number \(userNumber) is found as early as index \(index).")
        } else {
            print("The number \(userNumber) was not found in the array.")
        }
    }

} while userNumberString != "q"

// Function to fill array with 10 random numbers between 1 and 100
func populatingArray() -> [Int] {
    var arrayRandomInts: [Int] = []

    for _ in 0 ..< MAX_ARRAY {
        let randomInt = Int.random(in: 1...100)
        arrayRandomInts.append(randomInt)
    }

    return arrayRandomInts
}
