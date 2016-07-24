//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var array1 = [1,2,3,4,5,6]

var array2 = [3,4,5]


// this works to find equal elements in either array, but seems not very efficient?

for i in 0 ..< array1.count {
    var counter1 = array1[i]
    for x in 0 ..< array2.count {
        var counter2 = array2[x]
        if counter1 == counter2 {
            print("counter1 \(counter1) counter2 \(counter2)")
            break
        } else {
            print("counters did not equal")
        }
    }
    
}

let results = array2.filter({ $0 == 4 })

for i in 0 ..< array1.count {
    let counter = array1[i]
    let filter = array2.filter({ $0 == counter })
}

var matches = 0

if array1 != array2 {
    for x in array1 {
//        array2.append(x)
//        print(array2)
        if array2.contains(x) {
            break
        } else {
            array1.append(x)
        }
    }
}

for x in array1 {
    if !array2.contains(x) {
        array2.append(x)
        print(array2)
    }
}
