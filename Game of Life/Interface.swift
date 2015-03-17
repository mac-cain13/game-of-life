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

    eachPositionWithinEdges(edges) { position, lastOfRow in
      let cell = cellAtPosition(position)
      print("\(cell)")

      if lastOfRow {
        println("")
      }
    }
  }
}
