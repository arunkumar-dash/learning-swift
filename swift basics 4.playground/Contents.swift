import UIKit

var greeting = "Hello, playground"

//opaque types

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw(), type(of: trapezoid))

//ARC

var optInt: Int! = 89
var notOptInt = optInt!
var implicitUnwrap: Int = optInt
print(type(of: optInt), type(of: notOptInt), type(of: implicitUnwrap))


//conflicting access

var test = 1
func multTest(number: inout Int){
    number *= test
}
// multTest(number: &test) // Simultaneous accesses to 0x107ef5d98, but modification requires exclusive access.

private class Private{
    public var a: Int
    init(a: Int) {
        self.a = a
    }
}

public class Public{
    private var a=Private(a: 78)
    func ab() {
        print(a.a)
    }
}

private var a = Private(a: 67)
a.a
var overflowAdd = UInt.max
print(overflowAdd)
overflowAdd&+1


