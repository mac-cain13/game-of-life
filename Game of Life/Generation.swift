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
      let nextGenCell = nextGenerationOfCell(cell, aliveNeighbours: aliveNeighboursCount)

      if nextGenCell == .Alive || position == Origin {
        nextGeneration[position] = nextGenCell
      }
    }
  }

  return nextGeneration
}

func cellFromGenerationAtPosition(generation: Generation)(_ position: Position) -> Cell {
  return generation[position] ?? .Dead
}

func nextGenerationOfCell(cell: Cell, # aliveNeighbours: Int) -> Cell {
  switch aliveNeighbours {
  case 2:
    return cell
  case 3:
    return .Alive
  default:
    return .Dead
  }
}

func ==(lhs: [Position: Cell], rhs: [Position: Cell]) -> Bool {

  let rhsCellAtPosition = cellFromGenerationAtPosition(rhs)
  for (position, cell) in lhs {
    if rhsCellAtPosition(position) != cell {
      return false
    }
  }

  return true
}
