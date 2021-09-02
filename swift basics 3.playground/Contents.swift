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


//error handling

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

//async, await
//actor

//typecast

class Parent{
    var parent: String
    init(name: String){
        self.parent=name
    }
    func aa() -> Self{
        return self
    }
}

class GirlChild: Parent{
    var boyName: String
    override init(name: String) {
        self.boyName=name
        super.init(name: name)
    }
}

class BoyChild: Parent{
    var girlName: String
    override init(name: String) {
        self.girlName=name
        super.init(name: name)
    }
}

var sds=Parent(name: "kk").aa()
type(of: sds)


var children=[BoyChild(name: "arun"),GirlChild(name: "priya")]

print(type(of: children))

for i in children{
    if let name = i as? BoyChild{
        print(name.girlName)
    }
    else if let name = i as? GirlChild{
        print(name.boyName)
    }
}
print("\u{1F609} 😉")


//extensions

extension BoyChild{
    func sport(){
        print("Plays")
    }
}

extension GirlChild{
    func studies(){
        print("Study")
    }
}

children.append(BoyChild(name: "newArun"))

if let sport = children[2] as? BoyChild{
    sport.sport()
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

