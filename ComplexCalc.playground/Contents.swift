//: # UW Complex Calculator
//:
print("Welcome back to the UW Calculator")

//: ## Your tasks
//: The simple calculator you explored in the previous assignment was a smashing success with Upper Management, and they want more. Specifically, they want a version of it in a nicely self-contained class that they can import everywhere they need calculation capabilities throughout the enterprise. This is a mission-critical project!
//:
//: > PRO TIP: Not really.
//: 
//: Your job, then, is to create a Calculator class that performs the canonical operations of a calculator (add, subtract, multiply, etc) as well as a few other operations. 
//: 
//: In fact, knowing that Upper Management always has things going on that they don't tell you about, part of the goal is to make the calculator a little more flexible than the creators intended, and able to provide calculation using custom-built operations that the Calculator doesn't know about. In order to do that, the Calculator will be using "higher-order functions" to carry out its operations.
//: 
//: > PRO TIP: Don't always assume this when you get into the Real World (TM); sometimes they do, sometimes they don't, but adding a bunch of extensibility and additional features to code that isn't something the customer actually wants is known as "gold-plating" the code, and is just as much of a problem as not delivering what the customer actually wants.
//: 
//: Additionally, certain mathematical operations (add, multiply) support more than two parameters, which we should also support. These will take arrays of Integers as the single parameter.
//: 
//: On top of that, we should be able to perform some operations on some different data types, such as Cartesian points (x,y pairs), so our Calculator will need to support those as well. (Implementation note: by the use of the word "pairs" here, I mean to use tuples--specifically, `Int,Int` tuples. Two-element tuples are commonly called "pairs", three-element tuples are sometimes called "triplets", and four-element tuples are sometimes called "quads". If you get to a five-element tuple, you have a problem, just create a class or a struct and be done with it.)
//: 
//: And, because your instructor is an evil, evil man, we also want the Calculator to be able to add and subtract Cartesian points represented in `String-to-Int` dictionaries (maps), as well.
//: 
//: All of these will be backed by tests in the Playground code, so that you can know whether your code is working according to specification or not. You are free to look at the tests (they're right below the big comment line), but you may not modify them. If you want to add to them, that's acceptable, so long as you do it in the space provided.
//: 
//: > PRO TIP: It is strongly suggested that as you get each test working, commit your code to GitHub. Each time you get a little bit working, commit to GitHub. It is far, far easier for I and the TA to figure out where something went wrong and get you partial credit if we have a commit history to examine, as opposed to a "commit everything when I'm done" style that college students so often prefer. It's easier on your boss, too, when you get to a Real Job, if you have a rich commit history; on top of that, if you have something working, commit it, then make a change and the whole world seems to blow up, you can always revert back to that previous place of goodness and start over. Can't do that unless you commit regularly, though.
//:
//: Remember, don't change any of the pre-existing tests! *HOWEVER*, you are allowed to comment out some or all of the tests on a temporary basis in order to verify that the code is working--just remember to uncomment all of them before declaring the code finished.
//:
//: IMPORTANT: If any tests are commented out, you will be graded a zero (0)! You should never be in the habit of eliminating tests to make the code pass.
//:
class Calculator {
    func add(lhs num1: Int, rhs num2: Int) -> Int {
        return num1+num2
    }
    func add(_ nums: [Int]) -> Int {
        var total: Int = 0
        
        // what if we get an empty array
        for i in 0...(nums.count - 1) {
            total += nums[i]
        }
        return total
    }
    func add(lhs num1: (Int, Int), rhs num2: (Int, Int)) -> (Int, Int) {
        return (num1.0 + num2.0, num1.1 + num2.1);
    }
    func add(lhs num1: [String: Int], rhs num2: [String: Int]) -> [String: Int] {
        let x1 = num1["x"] ?? 0 // you need to do this ?? 0 because you need to have a plan b incase
        // your dictionary doesn't have the key you're looking for
        let y1 = num1["y"] ?? 0
        let x2 = num2["x"] ?? 0
        let y2 = num2["y"] ?? 0
        return ["x": x1 + x2, "y": y1 + y2];
    }
    
    func subtract(lhs num1: Int, rhs num2: Int) -> Int {
        return num1 - num2;
    }
    func subtract(lhs num1: (Int, Int), rhs num2: (Int, Int)) -> (Int, Int) {
        return (num1.0 - num2.0, num1.1 - num2.1);
    }
    func subtract(lhs num1: [String: Int], rhs num2: [String: Int]) -> [String: Int] {
        let x1 = num1["x"] ?? 0 // you need to do this ?? 0 because you need to have a plan b incase
        // your dictionary doesn't have the key you're looking for
        let y1 = num1["y"] ?? 0
        let x2 = num2["x"] ?? 0
        let y2 = num2["y"] ?? 0
        return ["x": x1 - x2, "y": y1 - y2];
    }
    
    func multiply(lhs num1: Int, rhs num2: Int) -> Int {
        return num1*num2;
    }
    func multiply(_ nums: [Int]) -> Int {
        var total: Int = 1;
        
        // what if we get an empty array
        for i in 0...(nums.count - 1) {
            total *= nums[i]
        }
        return total;
    }
    
    func divide(lhs num1: Int, rhs num2: Int) -> Int {
        return num1/num2;
    }
    
    func count(_ nums: [Int]) -> Int {
        return nums.count;
    }
    
    func avg(_ nums: [Int]) -> Int {
        return add(nums) / nums.count;
    }
    
    func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        var lhs: Int = beg
        for n in 0...(args.count-1) {
            let p = op(lhs, args[n])
            lhs = p
        }
        return lhs
    }
}

//: Don't change the name of this object (`calc`); it's used in all the tests.
let calc = Calculator()

//: ## Extra credit
//: Add in your own tests here; they should not test something that is already covered by an existing test, but rest assured that I have not tested every boundary condition. Feel free to explore a variety of ideas, and do not be surprised if you come up with a possibility that isn't covered in my requirements! (I have been known to give extra credit if you find one!)
//:
//: We will give 0-2 pts depending on how pervasive and useful your new tests are.
//:
//: Suggestions for new tests: What about negative numbers? What about avg and an empty array? What about add or multiply with an empty array?
//:
//: Keep in mind that writing new tests may reveal ambiguity in the specification above--if that's the case, document the ambiguity, declare what you think *should* happen, and write the test to test for it.

// ===== Your tests go here

//: ---
//: ## Test code block
//: Do not modify the code in this section
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]

calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]

