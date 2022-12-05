while let input = readLine() {
    guard input != "quit" else {
        break
    }
    
    if !inputArray.contains(input) {
        inputArray.append(input)
        print("You entered: \(input)")
    } else {
        print("Negative. \"\(input)\" already exits")
    }
    
    print()
    print("Enter a word:")
}
