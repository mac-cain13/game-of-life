//
//  main.swift
//  Game of Life
//
//  Created by Mathijs Kadijk on 15-03-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

import Foundation

var currentGeneration: Generation = [
  Position(x: 1, y: 0): .Alive,
  Position(x: 2, y: 1): .Alive,
  Position(x: 0, y: 2): .Alive,
  Position(x: 1, y: 2): .Alive,
  Position(x: 2, y: 2): .Alive,

  Position(x: 9, y: 10): .Alive,
  Position(x: 10, y: 10): .Alive,
  Position(x: 11, y: 10): .Alive,
  Position(x: 10, y: 11): .Alive,
]

while true {
  system("clear")
  
  currentGeneration = nextGeneration(currentGeneration)
  printGeneration(currentGeneration)

  NSThread.sleepForTimeInterval(0.5)
}
