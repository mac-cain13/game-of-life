//
//  Interface.swift
//  Game of Life
//
//  Created by Mathijs Kadijk on 17-03-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

import Foundation

func getInput() -> String {
  let keyboard = NSFileHandle.fileHandleWithStandardInput()
  let inputString = NSString(data: keyboard.availableData, encoding:NSUTF8StringEncoding) ?? ""

  return inputString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func printGeneration(generation: Generation) {

  if let edges = edgesForGeneration(generation) {

    let cellAtPosition = cellFromGenerationAtPosition(generation)

    for y in edges.top...edges.bottom {
      for x in edges.left...edges.right {
        let position = Position(x: x, y: y)
        let cell = cellAtPosition(position)
        print("\(cell)")
      }
      println("")
    }
  }
}

func delay(delay: Double, closure: Void -> Void) {
  dispatch_after(
    dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))),
    dispatch_get_main_queue(),
    closure
  )
}
