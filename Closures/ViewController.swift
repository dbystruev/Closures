//
//  ViewController.swift
//  Closures
//
//  Created by Denis Bystruev on 11/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var color = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sum(1, 2, 3, 4, 5))
        
        print(closure(10, 11, 12, 13, 14, 15))
        
        let tracks = [Track]()
        
        let _ = tracks.sorted { first, second -> Bool in
            return first.trackNumber < second.trackNumber
        }
        
        let _ = tracks.sorted { $0.trackNumber < $1.trackNumber }
        
        let _ = tracks.sorted(by: <)
        
        fetchImage { image in
            // ...
            self.color = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        }
        
        print([1, 2, 3].map { $0 * $0 })
        print(["1", "error", "2", "3"].map { Int($0) })
        print(["1", "error", "2", "3"].compactMap { Int($0) })
        print([1, 2, 3].filter { $0 % 2 == 0 } )
        print([1, 2, 3].reduce(0) { $0 + $1 } )
    
    }
    
    func fetch() {
        
    }
    
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        completion(nil)
        completion(UIImage(named: ""))
    }

    func sum(_ numbers: Int...) -> Int {
        var total = 0
        
        for number in numbers {
            total += number
        }
        
        return total
    }
    
    let closure = { (numbers: Int...) -> Int in
        var total = 0
        
        for number in numbers {
            total += number
        }
        
        return total
    }
    
    let voidClosure = { () -> Void in
        print("Void closure")
    }
    
    let parameterClosure = { (string: String) -> Void in
        print(string)
    }
    
    let returnClosure = { () -> Int in
        return Int.random(in: 0 ..< 10)
    }
    
    let fullClosure = { (a: Int, b: Double) -> Bool in
        return Double(a) < b
    }
}

struct Track: Comparable {
    var trackNumber: Int
    
    static func < (left: Track, right: Track) -> Bool {
        return left.trackNumber < right.trackNumber
    }
}

protocol MyStringProtocol {
    var string: String { get }
    
    func printString()
}

extension MyStringProtocol {
    func printString() {
        print(string)
    }
}

struct MyStruct: MyStringProtocol {
    var string: String
}
