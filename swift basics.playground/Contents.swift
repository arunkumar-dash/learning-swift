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

let arr : [String] = ["a", "b", "c"]
for i in 0..<arr.count{
    print(arr[i])
}
for i in arr[0...]{
    print(i)
}

//read user inputs
/*
var aReadLine = readLine()
if let aInt = aReadLine {
    print("You typed \(aInt)")
}
else {
    print(#"nothing was typed \u{1F319}"#)
    print("nothing was typed \u{1F319}")
}
 */

//startIndex
var aString: String = "Hello World"
print(aString[aString.startIndex], aString[aString.index(before: aString.endIndex)], aString[aString.index(after: aString.startIndex)])

print(aString.hasPrefix("Hell"))

//Collections
var array: [String] = Array(repeating: "panda", count: 12)
var arrayOfArrays: [[Int]] = [[89,9],[12,123]]
for i in arrayOfArrays{
    for j in i.reversed(){
        print(j)
    }
}
