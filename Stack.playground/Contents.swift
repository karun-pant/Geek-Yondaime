import Foundation

struct Stack<T> {
    private var arr: [T] = []
    public var isEmpty:Bool {
        get {
            return arr.count == 0
        }
    }
    
    public mutating func pushAll(_ elements: [T]) {
        elements.forEach{push($0)}
    }
    
    public mutating func push(_ element: T) {
        arr.append(element)
    }
    
    public mutating func pop() -> T? {
        return arr.popLast()
    }
    
    public func peek() -> T? {
        return arr.last
    }
    
    public mutating func clearAll() {
        arr.removeAll()
    }
    
}

/*
 Given an expression string exp , write a program to examine whether the pairs and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct in exp. For example, the program should print true for exp = “[()]{}{[()()]()}” and false for exp = “[(])”
 */

func checkBalance(_ subjectString: String) -> Bool {
    if subjectString.count >= 2 {
        
        var stack: Stack<Character> = Stack<Character>()
        let seperatedArray = Array(subjectString)
        
        seperatedArray.forEach { (character) in
            if character == "(" || character == "{" || character == "[" {
                stack.push(character)
            }else if (character == ")" || character == "}" || character == "]") && !stack.isEmpty  {
                stack.pop()
            }
        }
        return stack.isEmpty
    }else{
        return true
    }
}

checkBalance("[()]{}{[()()]()()}")


/*
 The stock span problem is a financial problem where we have a series of n daily price quotes for a stock and we need to calculate span of stock’s price for all n days.
 The span Si of the stock’s price on a given day i is defined as the maximum number of consecutive days just before the given day, for which the price of the stock on the current day is less than or equal to its price on the given day.
 For example, if an array of 7 days prices is given as {100, 80, 60, 70, 60, 75, 85}, then the span values for corresponding 7 days are {1, 1, 1, 2, 1, 4, 6}
 
 Solve in O(n)
 More details @ https://www.geeksforgeeks.org/the-stock-span-problem/
 */
//func stockSpan(_ dailyStockPrices: [Double]) -> [Int] {
//    guard dailyStockPrices.count > 0 else { return [] }
//    if dailyStockPrices.count == 1 { return [1] }
//
//    var stack: Stack<Int> = Stack<Int>()
//    stack.push(0)
//    var span: [Int] = [1]
//    for i in 1..<dailyStockPrices.count {
//        while !stack.isEmpty && dailyStockPrices[stack.peek() ?? 0] <= dailyStockPrices[i] {
//            stack.pop()
//        }
//        if stack.isEmpty {
//            span.append(i + 1)
//        }else {
//            span.append(i - (stack.peek() ?? 0))
//        }
//        stack.push(i)
//    }
//    return span
//}
//
//let dailyPrices = [100.0, 80.0, 60.0, 70.0, 60.0, 75.0, 85.0, 100.0, 80.0, 60.0, 70.0, 60.0, 75.0, 85.0]
//stockSpan(dailyPrices)
