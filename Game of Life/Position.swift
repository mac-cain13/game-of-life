//
//  Position.swift
//  Game of Life
//
//  Created by Mathijs Kadijk on 17-03-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

struct Position: Hashable, Comparable {
  let x: Int32
  let y: Int32

  var hashValue: Int {
    let bigX = Int64(x)
    let bigY = Int64(y)
    return Int(bigX << 32 | bigY)
  }
}

let Origin = Position(x: 0, y: 0)

func ==(lhs: Position, rhs: Position) -> Bool {
  return lhs.y == rhs.y && lhs.x == rhs.x
}

func <(lhs: Position, rhs: Position) -> Bool {
  return lhs.y < rhs.y || (lhs.y == rhs.y && lhs.x < rhs.x)
}

func neighbourPositions(p: Position) -> [Position] {
  return [
    Position(x: p.x-1, y: p.y-1),
    Position(x: p.x  , y: p.y-1),
    Position(x: p.x+1, y: p.y-1),
    Position(x: p.x-1, y: p.y  ),
    Position(x: p.x+1, y: p.y  ),
    Position(x: p.x-1, y: p.y+1),
    Position(x: p.x  , y: p.y+1),
    Position(x: p.x+1, y: p.y+1)
  ]
}
