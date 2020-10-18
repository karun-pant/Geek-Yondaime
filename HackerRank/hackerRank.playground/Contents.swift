import Foundation

// MARK:- Sock Merchant Problem:
/*
 John works at a clothing store. He has a large pile of socks that he must pair by color for sale. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
 */

//struct Socks {
//    var availableInventory = 0.0
//    var pairs: Int {
//        get {
//            return Int(availableInventory/2.0)
//        }
//    }
//}
//func sockMerchant(ar: [Int]) -> Int {
//    var colorCodePairs:[Int: Socks] = [Int: Socks]()
//    for colorCode in ar {
//        if var socks = colorCodePairs[colorCode] {
//            socks.availableInventory += 1
//            colorCodePairs[colorCode] = socks
//        }else {
//            var newSock = Socks()
//            newSock.availableInventory += 1
//            colorCodePairs[colorCode] = newSock
//        }
//    }
//    let totalPairs = colorCodePairs.keys.map { colorCodePairs[$0]?.pairs ?? 0 }.reduce(0, +)
//    return totalPairs
//}
//
//print(sockMerchant(ar: [10, 20, 20, 10, 10, 30, 50, 10, 20, 20,50]))

// MARK:- Avid Hiker problem
/*
 Gary is an avid hiker. He tracks his hikes meticulously, paying close attention to small details like topography. During his last hike he took exactly  steps. For every step he took, he noted if it was an uphill, , or a downhill,  step. Gary's hikes start and end at sea level and each step up or down represents a  unit change in altitude. We define the following terms:
 
 A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
 A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
 Given Gary's sequence of up and down steps during his last hike, find and print the number of valleys he walked through.
 */
//func countingValleys(s: String) -> Int {
//    var level = 0
//    var valleys = 0
//    var previousLevel = 0
//    let steps = Array(s)
//    for step in  steps {
//        if step == "U" {
//            level += 1
//        }else {
//            level -= 1
//        }
//        if (level < 0 && previousLevel == 0) {
//            valleys += 1
//        }
//        previousLevel = level
//    }
//    return valleys
//}
//
//print(countingValleys(s: "UDDDUDUUDDUU"))

// MARK:- Jumping on the Clouds
/*
  Emma will get an array of clouds numbered  if they are safe or  if they must be avoided. For example,  indexed from. The number on each cloud is its index in the list so she must avoid the clouds at indexes  and. She could follow the following two paths:  or . The first path takes jumps while the second takes. Find minimum number of steps to complete level.
 */
//func jumpingOnClouds(c: [Int]) -> (Int, Bool) {
//
//    var isRaceComplete = false
//    var index = 0
//    var step = 0
//    while index < c.count {
//        if c[index] == 0 {
//            if index + 2  < c.count && c[index + 2] == 0 {
//                step += 1
//                index = index + 2
//            }else if index + 1  < c.count && c[index + 1] == 0 {
//                step += 1
//                index = index + 1
//            }else if index == c.count - 1 {
//                isRaceComplete = true
//                break
//            }else {
//                step += 1
//                index += 1
//            }
//        }else {
//            index += 1
//        }
//    }
//    return (step, isRaceComplete)
//}
//let result = jumpingOnClouds(c: [0, 0, 1, 0, 0, 1, 0, 1])
//print("minimum Steps: \(result.0), and the game \(result.1 ? "is Finished." : "cannot be completed.")")


// MARK:- reverseWords

//func reverseWords(inputWords: String) -> String {
//    let words = inputWords.components(separatedBy: " ")
//    return words.reversed().joined(separator: " ")
//}
//
//print(reverseWords(inputWords: "hopscotch is best"))

// MARK:- getFirstTwoItemsWithoutPair

//func sortDates(dates: [String]) -> [String] {
//    var convertedArray: [Date] = []
//
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dd MMM yyyy"// yyyy-MM-dd"
//
//    for dateStr in dates {
//        if let date = formatter.date(from: dateStr){
//            convertedArray.append(date)
//        }
//    }
//
//    return convertedArray.sorted(by: { $0.compare($1) == .orderedAscending }).map({formatter.string(from: $0)})
//}
//
//print(sortDates(dates: ["25 Jun 2016", "30 Jun 2016", "28 Jun 2016", "2 Jul 2016"]))

//  MARK:- getFirstTwoItemsWithoutPair

//func getFirstTwoItemsWithoutPair(list: [Int]) -> [Int] {
//    var nonRepeated = [Int]()
//    var isPairFound = false
//    for (i, iItem) in list.enumerated() {
//        isPairFound = false
//        for (j, jItem) in list.enumerated() {
//            if i != j && iItem == jItem {
//                isPairFound = true
//                break
//            }
//        }
//        if !isPairFound {
//            nonRepeated.append(iItem)
//            if nonRepeated.count == 2 {
//                break
//            }
//        }
//    }
//    return nonRepeated
//}
//
//print(getFirstTwoItemsWithoutPair(list: [2,23,23,66,7,2]))

// MARK:-  Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

//func printMaxAndMinSum(fiveInts: [Int]) {
//    let sorted = fiveInts.sorted()
//    var maxSum = 0
//    var minSum = 0
//    sorted.enumerated().forEach {
//        if $0.offset != 0 {
//            maxSum += $0.element
//        }
//        if $0.offset < 4 {
//            minSum += $0.element
//        }
//    }
//    print("\(maxSum) \(minSum)")
//}

// MARK:-  You are in charge of the cake for a child's birthday. You have decided the cake will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Count how many candles are tallest.

//func tallestCandleCount(candles: [Int]) -> Int {
//    guard !candles.isEmpty else {
//        return 0
//    }
//    let sorted = candles.sorted(by: >)
//    var numberOfTallestCandles = 0
//    let tallestCandle = sorted[0]
//    for candle in sorted {
//        if tallestCandle != candle {
//            break
//        }
//        numberOfTallestCandles += 1
//    }
//    return numberOfTallestCandles
//}
//
//print(tallestCandleCount(candles: [9,2,4,5,4,9,9,7,9,1,2,9]))

