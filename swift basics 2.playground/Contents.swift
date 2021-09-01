import UIKit

//operator overloading

infix operator +
func +(a: AddTest, b: AddTest) -> Int {
    return a.a-b.a
}

infix operator -
func -(a: AddTest, b: AddTest) -> Int {
    return a.a+b.a
}

prefix func +(a: AddTest) -> AddTest {
    return AddTest(a: -a.a)
}

class AddTest{
    let a: Int
    init(a:Int){
        self.a=a
    }
}

var a = AddTest(a:90)
var b = AddTest(a:89)
print(a+b, a-b, (+a).a)

//functions

func greet(name: String) -> String {
    return ("Hello \(name)")
}
print(greet(name: "arun"))

func greet1(name: Any) -> Void {
    print("Hello", name)
}

print(greet1(name: "arun kumar"))

//argument labels

func greet(name a: String, times b: Int) -> String {
    return String(repeating: a, count: b)
}

greet(name: "hi ", times: 5)

//placeholders

func greet3(_ a: String){
    print(a)
}

greet3("hello world")


//variadic parameters

func varSum(_ arr: Int...) -> Int {
    var sum: Int = 0
    for i in arr{
        sum+=i
    }
    return sum
}

print(varSum(1,2))
print(varSum(1,2,3,4))

func prefixAdd(a: inout Int) -> Int{
    a+=1;
    return a
}

var temp=21
print(temp, prefixAdd(a: &temp), temp)

prefix func ++(a: inout Int) -> Int{
    a+=1
    return a
}
print(temp, ++temp, temp)

//using function references

var prefixAdd1: (inout Int) -> Int = prefixAdd

print(temp, prefixAdd1(&temp))


//closures

var strArray : [String] = ["arun", "b", "ar", "fftt", "aru"]

//to sort by length using closures

func lengthCmp(a: String, b: String) -> Bool{
    return a.count<b.count
}

print(strArray.sorted(), strArray.sorted(by: lengthCmp))

print(strArray.sorted(by: {(a: String, b: String) -> Bool
in
    return a.count<b.count
}))

print(strArray.sorted(by: {a,b in return a.count>b.count}))

print(strArray.sorted(by: {a,b in a.count<b.count}))

print(strArray.sorted(by: {$0.count > $1.count}))

print(strArray.sorted(by: >))

print(strArray.map({$0.uppercased()}))

//escaping closures

var test: () -> Void = {print("cc")}
func s(c: @escaping () -> Void){
    test=c
    c()
}
test()
var x=7
s {
    print("closures are cool")
    x+=1
}
print(x)
test()



