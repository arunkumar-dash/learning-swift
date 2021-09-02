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
