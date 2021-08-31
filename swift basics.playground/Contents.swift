import UIKit


//Testing commits
var greeting = "Hello, playground"
let a = 20
let b = 45.566
print(Double(a)+b)
var c: Int = 9000
print(a&c)

//tuples and ternary operator
var (x,y,z)=(1,2,3)
print(x == y ? "\(x) equals \(y)" : (y == z ? "\(y) equals \(z)" : (x == z ? "\(x) equals \(z)" : "nothing matches")))  // not a good practice to combine ternary operators

//comparing tuples
print( (1, "arun") < (2, "kumar") )
print( ("arun", 2) < ("kumar", 1) )

//nil coalescing
let aOptional : Int? = 45
print( aOptional != nil ? aOptional! : "nothing" )
print(aOptional ?? "nothing") //nil coalescing operator

//range
for _ in 1...5 {
    print("hi")
}

for _ in 1..<5 {
    print("hii")
}

let arr : [Int] = [1, 2, 3]
for i in 0..<arr.count{
    print(arr[i])
}
