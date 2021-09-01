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


