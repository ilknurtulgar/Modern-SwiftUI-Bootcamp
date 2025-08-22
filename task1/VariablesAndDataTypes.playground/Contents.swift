import UIKit


class Person {
    var name : String
    var age: Int
    var isStudent: Bool
    var height : Double
    var favoriteCoffee : String?
    
    init(name: String, age: Int, isStudent: Bool, height: Double, favoriteCoffee: String? = nil) {
        self.name = name
        self.age = age
        self.isStudent = isStudent
        self.height = height
        self.favoriteCoffee = favoriteCoffee
    }
    
}

var person = Person(name: "ilkkus", age: 22, isStudent: true, height: 1.55, favoriteCoffee: "cappuccino")

print("name: \(person.name)")
print("age: \(person.age)")
print("isStudent: \(person.isStudent)")
print("height: \(person.height)")

if let  coffe = person.favoriteCoffee {
    print("favoriteCoffe: \(coffe)")
} else {
    print("favoriteCoffee nil")
}
