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

// 控制流 for in
let numbersArray = [1,2,3,4,5]
var totalNumber = 0
for number in numbersArray {
    totalNumber += 1
}
print(totalNumber)

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



