import UIKit

//properties
//lazy properties
class NotUsed{
    lazy var i = 12
}
let lazyTest = NotUsed()
print(lazyTest.i)

//computed properties
struct Body{
    var height: Float
    var weight: Float
    var bmi: Float{
        get{
            return weight/(height*height)
        }
        set(newbmi){
            height=sqrt(weight/bmi)
            weight=newbmi*(height*height)
        }
    }
}

var body = Body(height: 1.65, weight: 51)
print(body.bmi)
body.bmi = 21
print(body.height,body.weight)

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

//property wrapper
@propertyWrapper
struct Vowel{
    private var letter: Character = "0"
    var projectedValue="thiss"
    var wrappedValue: Character {
        get{
            return letter
        }
        set{
            if ["a","e","i","o","u"].contains(newValue){
                letter=newValue
            }
            else{
                letter="0"
            }
        }
    }
}

struct Sentence{
    @Vowel var article1: Character
}

var articlesTest=Sentence()
print(articlesTest.article1)
articlesTest.article1="e"
print(articlesTest.article1, articlesTest.$article1)
articlesTest.article1="j"
print(articlesTest.article1)

//subscripts

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
    subscript(inex: String) -> String{ //can override
        return inex
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])", threeTimesTable["overloads"])

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
print(Planet[4])

class Temp{
    var far: Double
    var kel: Double
    init(_ far: Double){
        self.far=far
        self.kel=0
    }
    convenience init(kelvin kel: Double) {
        self.init(0)
        self.kel=kel
    }
}
var re = Temp(89)


//deinitialization


class TestDeinit{
    var a: Int
    init(a: Int) {
        self.a=a
        print("class \(a) is initialized")
    }
    deinit {
        print("class \(self.a) is deinitialized")
    }
}

var objTest = TestDeinit(a: 1)

objTest = TestDeinit(a: 2)


