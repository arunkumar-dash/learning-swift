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

