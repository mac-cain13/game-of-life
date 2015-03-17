//
//  Generation.swift
//  Game of Life
//
//  Created by Mathijs Kadijk on 17-03-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

import Foundation

typealias Generation = [Position: Cell]

func nextGeneration(generation: Generation) -> Generation {
  var nextGeneration = Generation(minimumCapacity: generation.count)

  if let currentEdges = edgesForGeneration(generation) {
    let edges = expandEdges(currentEdges, byAmount: 1)
    let cellAtPosition = cellFromGenerationAtPosition(generation)

    eachPositionWithinEdges(edges) { position, _ in
      let cell = cellAtPosition(position)

      let aliveNeighboursCount = neighbourPositions(position).map(cellAtPosition).filter { $0 == Cell.Alive }.count
      let nextGen = nextGenerationOfCell(cell, aliveNeighbours: aliveNeighboursCount)

      if nextGen == .Alive || position == Origin {
        nextGeneration[position] = nextGen
      }
    }
  }

  return nextGeneration
}

func cellFromGenerationAtPosition(genetation: Generation)(_ position: Position) -> Cell {
  return genetation[position] ?? .Dead
}

func nextGenerationOfCell(c: Cell, # aliveNeighbours: Int) -> Cell {
  switch aliveNeighbours {
  case 2:
    return c

  case 3:
    return .Alive

  default:
    return .Dead
  }
}
