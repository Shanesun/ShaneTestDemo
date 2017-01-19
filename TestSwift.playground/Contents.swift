//: Playground - noun: a place where people can play

import UIKit

// 常量
let tmp1 = 2

// 变量
var tmp2 = 3

// 显性声明类型 类型转换
var tme3: String = "hello"

let label = "width is "
let width = 94
let widthLabel = label + String(width)

let stirng = "width is \(width)"

let name = "john"
let stringTmp = "name is \(name)"

// 字典 数组
var array = ["tmp1", "tmp2", "tmp3"]
array[0]

var dictionary = ["key1":"value1","key2":"value2"]
dictionary["key1"]

let emptyArray = [String]()
let emptyDictionary = [String:String]()

// 显式类型转换
var optionarlString: String? = "Hello"
print(optionarlString == nil)

var optionalName: String? = nil
var greeting = "Hello"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else{
    greeting = "don's say hello"
}

// ??
let nickName: String? = nil
let fullName: String = "Jonh"
let informalGreeting = "Hi \(nickName ?? fullName)"

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("add some raisins and make ants on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("is it a spicy \(x)")
default:
    print("everything tastes good in soup")
}

// for in
// 1
let numbersArray = [1,2,3,4,5]
var totalNumber = 0
for number in numbersArray {
    totalNumber += 1
}
print(totalNumber)
// 2
let interestingNumber = [
    "Prime":[2,3,4,5,6],
    "Fibonacci":[1,2,2,3,4],
    "square":[1,4,6,8,25],
]
var largest = 0
for (kind, numbers) in interestingNumber {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// while
var n = 2
while n<100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m*2
}while m<100
print(m)

var total = 0
for i in 0..<4 { // ..< 不包含上界， .. 包含上界
    total += 1
}
print(total)

// 函数和闭包
func greet(person:String, day:String)->String{
    return "Hello \(person), totday is \(day)"
}
greet(person: "bob", day: "tue")
// -省略参数标签
func greet2(_ person:String, day:String) -> String{
    return "Hello2 \(person), today is \(day) "
}
greet2("json", day: "wend");
// -元组
func calculateStatistics(scores:[Int]) -> (min:Int, max:Int, sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score>max {
            max = score
        }
        else if score < min{
            min = score
        }
        
        sum += score
    }

    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [24,53,3,2,99])
print(statistics.sum)
print(statistics.2)
// -可变参数
func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(numbers: 42,434,1)
// -嵌套函数
func returnFiftent() -> Int{
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFiftent()
// -返回函数
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number:Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)
// -函数参数
func hasAnyMatches(list:[Int], condition:(Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(_ number:Int) -> Bool{
    return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(list: numbers, condition: lessThanTen)
// -闭包
numbers.map { (nubmer:Int) -> Int in
    let result = 3 * nubmer
    return result
}
// -单句闭包
let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)
// -尾随闭包 省略括号
let sortedNumbers = numbers.sorted{$0>$1}
print(sortedNumbers)

// 对象和类
class Shape {
    var numberOfSides = 0
    func simpleDescreption() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescreption()
// 构造函数 初始化方法
class NameShape {
    var numberOfSides:Int = 0
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}
// -override
class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()
// -getter and setter
class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.perimeter)

// willSet didSet
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    var square:Square {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double, name:String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size:10, name:"another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.square.sideLength)

let optionalSquare: Square? = Square(sideLength:2.5, name:"optionarl square")
let sideLength = optionalSquare?.sideLength

// 枚举和结构体
enum Rank:Int{
    case Ace = 1
    case Two, Three,Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
        func simpleyDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
            
        case .Jack:
            return "jack"
            
        case .Queen:
            return "queen"
            
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleyDescription()
}

enum Suit{
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse{
    case Result(String, String)
    case Failure(String)
}
let success = ServerResponse.Result("6pm", "8pm")
let failure = ServerResponse.Failure("out of cheese")
switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Failure(message):
    print("Failure ... \(message)")
}

struct Card{
    var rank:Rank
    var suit:Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleyDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOFSpadesDescription = threeOfSpades.simpleDescription()

// 协议和扩展
protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty:Int = 7878
    func adjust() {
        simpleDescription += " now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

// Int类型 协议扩展
extension Int:ExampleProtocol {
    var simpleDescription:String {
        return "the number \(self)"
    }
    
    mutating func adjust(){
        self += 42;
    }
}
print(7.simpleDescription)

// 错误处理
enum PrinterError:Error {
    case OutOfPaper
    case Notoner
    case OnFire
}

func send(job:Int, toPriter printerName:String) throws -> String {
    if printerName == "Never has Toner"{
        throw PrinterError.Notoner
    }
    return "job sent"
}

do{
    let printerResponse = try send(job:1040, toPriter:"BiSheng")
    print(printerResponse)
}catch{
    print(error)
}

var fridgelsOpen = false
let fridgeContent = ["mile","eggs","leftovers"]

func fridgeContains(_ food:String) -> Bool{
    fridgelsOpen = true
    defer{
        fridgelsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgelsOpen)

// 泛型
func repeatItem<Item>(repeating item:Item, numberOftimes:Int) -> [Item]{
    var result = [Item]()
    for _ in 0..<numberOftimes{
        result.append(item)
    }
    return result
}

repeatItem(repeating: "knock", numberOftimes: 4)

// 重新实现Swift标准库中的可选类型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInterger: OptionalValue<Int> = .None
possibleInterger = .Some(100)
