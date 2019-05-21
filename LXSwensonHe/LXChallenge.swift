//
//  LXChallenge.swift
//  LXSwensonHe
//
//  Created by laxman penmetsa on 5/16/19.
//  Copyright © 2019 com.laxman. All rights reserved.
//

import Foundation

class LXChallenge: NSObject {
    
    //    I. Add arithmetic operators (add, subtract, multiply, divide) to make
    //    the following expressions true. You can use any parentheses you’d like.
    //    3 1 3 9 = 12
    //    Solution:    (3+1)/3 * 9
    
    
    //    II. Write a function/method utilizing Objective-C or Swift to determine whether
    //    two strings are anagrams or not 
    
    func compareTwoStringsAreAnagram(_ firstString: String, _ secondString: String) -> Bool {
        var firstDict = [Character: Int]()
        var secondDict = [Character: Int]()
        /*!+
         populate hashmap for all elemets in string with no of occurences
         compare the the occurences of each element in two strings
         +!*/
        populateHashMapForStringElements(firstString, dict: &firstDict)
        populateHashMapForStringElements(secondString, dict: &secondDict)
        if firstDict.keys.count != secondDict.keys.count{
            return false
        }
        for key in firstDict.keys{
            if firstDict[key] != secondDict[key]{
                return false
            }
        }
        return true
    }
    
    func populateHashMapForStringElements(_ givenString: String, dict: inout [Character: Int]) {
        for element in givenString{
            if element == " "{
                continue
            }
            if let count = dict[element]{
                dict[element] = count+1
            }else{
                dict[element] = 1
            }
        }
    }
    
    func fabinocciIterative(_ limit: Int) {
        guard limit > 1 else {
            print(1)
            return
        }
        
        if limit == 0{
            print("0")
        }
        if limit == 1{
            print("0 1")
        }else{
            var num1 = 0
            var num2 = 1
            while num2 <= limit{
                let num3 = num1 +  num2
                if num3 > limit{
                    return
                }
                print( num3 )
                num1 = num2
                num2 = num3
            }
        }
    }
    
    func fabinocciRecursive(_ a: Int = 0, _ b: Int = 1, _ limit: Int) -> Int {
        if limit == 0{
            return 0
        }
        if limit == 1{
            return 1
        }else{
            print(a+b)
            let sum = a + b
            return fabinocciRecursive(b,sum,limit-2)
        }
    }
}
