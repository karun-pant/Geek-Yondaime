func findleadingFaviorite(x:Int, y: Int, nums: [Int]) -> [Int] {
    var numberOfX = 0
    var numberOfY = 0
    var nextIndex = -1
    var firstIndex = -1
    for i in 0..<nums.count {
        if (x == nums[i]) {
            numberOfX += 1
            if firstIndex < 0 {
                firstIndex = i
            }
        }
        if (y == nums[i]) {
            numberOfY += 1
            if firstIndex < 0 {
                firstIndex = i
            }
        }
        if numberOfY == numberOfX && numberOfX != 0 && numberOfY != 0 && (y == nums[i] || x == nums[i]){
            nextIndex = i
        }
    }
    if firstIndex < 0 || nextIndex < 0 {
        return Array()
    }
    let subArray = nums[firstIndex...nextIndex]
    return Array(subArray)
}

let nums = [5,43,5,43,5,43,5,6,7,8,9,0]
let leadingFavourite = findleadingFaviorite(x: 43, y: 5, nums: nums)
print(leadingFavourite.count > 0 ? leadingFavourite : -1)



