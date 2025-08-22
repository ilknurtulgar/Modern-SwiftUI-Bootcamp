import Foundation

//function usage

enum Process : String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

func calculator(type : Process,num1: Double, num2: Double) -> Double {
    switch type {
    case .addition:
        return num1 + num2
    case .subtraction:
        return num1 - num2
    case .multiplication:
        return num1 * num2
    case .division:
        return num1 / num2
    }
}

let result = calculator(type: .division, num1: 5, num2: 2)
print("calculator result: \(result) 🤓")

//closure usage

var array: [Int] = [1,2,3,4,5,6]

let filteredArray = array.filter {item in
    item % 2 == 0
    
}
print("filteredArray: \(filteredArray)")

let sortedArray = array.sorted { $0 > $1}
print("sortedArray: \(sortedArray)")
