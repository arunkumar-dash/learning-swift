import UIKit

var greeting = "Hello, playground"
//threading




let current = Thread.current

print("current thread", current, current.stackSize)

let secondary = Thread()
secondary.name = "seconfdray"
print("secondary thread stack size", secondary.stackSize)

secondary.stackSize = 4096*512

print(secondary.stackSize)

print(Thread.isMainThread)

class ThreadCreate{
    lazy var createThread = {[self] in
        Thread.detachNewThreadSelector(#selector(print), toTarget: self, with: nil)}
    
    @objc func print(){
        Swift.print("Thread loop running", Thread.current)
    }
    
}
var testThread: ThreadCreate? = ThreadCreate()
testThread!.createThread()

testThread = ThreadCreate()

testThread!.createThread()

testThread = nil

DispatchQueue.global().async {
    for i in 0...100000{
        if i==98768{
            print("still inside loop")
        }
    }
    print("async code")
}

DispatchQueue.global().async {
    print("async codes again")
}

DispatchQueue.global().sync {
    print("synchronous code")
}

DispatchQueue.main.async {
    print("main async")
}

let concurrentQueueCustom = DispatchQueue(label: "concurrent", attributes: .concurrent)

concurrentQueueCustom.async {
    print("concurrent custom asyn code")
}

let serialQueueCustom = DispatchQueue(label: "serial", qos: .userInitiated, target: .global())

serialQueueCustom.async {
    print("async serial queue code")
}

